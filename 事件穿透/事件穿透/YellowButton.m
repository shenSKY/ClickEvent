//
//  YellowButton.m
//  事件穿透
//
//  Created by 沈凯 on 2018/5/2.
//  Copyright © 2018年 Ssky. All rights reserved.
//

#import "YellowButton.h"

@interface YellowButton()

@end

@implementation YellowButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGFloat min_x = -30.0;
    CGFloat min_y = -30.0;
    CGFloat max_x = self.frame.size.width + 30;
    CGFloat max_y = self.frame.size.height + 30;
    
    if (point.x <= max_x && point.x >= min_x && point.y <= max_y && point.y >= min_y) {
        point = CGPointMake(0, 0);
        return [super hitTest:point withEvent:event];
    }else {
        return [super hitTest:point withEvent:event];
    }
    
}
@end
