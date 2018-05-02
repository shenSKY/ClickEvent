//
//  ViewController.m
//  事件穿透
//
//  Created by 沈凯 on 2018/5/2.
//  Copyright © 2018年 Ssky. All rights reserved.
//

#import "ViewController.h"
#import "RedButton.h"
#import "YellowButton.h"

#define screen_height [UIScreen mainScreen].bounds.size.height
#define screen_width [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setUpSubViewToThrough];
    
    [self setUpSubViewToArea];
}
#pragma mark 点击事件穿透
- (void)setUpSubViewToThrough {
    
    CGFloat blue_width = screen_width / 3;
    CGFloat blue_height = blue_width;
    CGFloat blue_x = (screen_width - blue_width * 2) / 2;
    CGFloat blue_y = (screen_height - blue_height * 2) / 2;
    UIButton *blue = [[UIButton alloc]init];
    [blue setFrame:(CGRect){blue_x, blue_y, blue_width, blue_height}];
    [blue setBackgroundColor:[UIColor blueColor]];
    [blue addTarget:self action:@selector(blueButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blue];
    
    CGFloat red_width = screen_width / 2;
    CGFloat red_height = red_width;
    CGFloat red_x = blue_x * 2;
    CGFloat red_y = (screen_height - blue_height) / 2;
    RedButton *red = [[RedButton alloc]initWithFrame:(CGRect){red_x, red_y, red_width, red_height}];
    [red addTarget:self action:@selector(redButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:red];
    
    red.button = blue;
}

- (void)blueButtonAction:(UIButton *)sender {
    NSLog(@"点击蓝按钮");
}

- (void)redButtonAction:(UIButton *)sender {
    NSLog(@"点击红按钮");
}

#pragma mark 扩大点击区域
- (void)setUpSubViewToArea {
    
    CGFloat yellow_width = screen_width / 3;
    CGFloat yellow_height = yellow_width;
    CGFloat yellow_x = (screen_width - yellow_width) / 2;
    CGFloat yellow_y = (screen_height - yellow_height) / 2;
    YellowButton *yellow = [[YellowButton alloc]initWithFrame:(CGRect){yellow_x, yellow_y, yellow_width, yellow_height}];
    [yellow addTarget:self action:@selector(yellowButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:yellow];
    
    CGFloat backgroundView_width = yellow_width + 60;
    CGFloat backgroundView_height = backgroundView_width;
    CGFloat backgroundView_x = yellow_x - 30;
    CGFloat backgroundView_y = yellow_y - 30;
    UIView *backgroundView = [[UIView alloc]initWithFrame:(CGRect){backgroundView_x, backgroundView_y, backgroundView_width, backgroundView_height}];
    backgroundView.backgroundColor = [UIColor redColor];
    [self.view insertSubview:backgroundView belowSubview:yellow];
}

- (void)yellowButtonAction:(UIButton *)sender {
    NSLog(@"点击黄按钮");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
