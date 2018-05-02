//
//  RedButton.m
//  事件穿透
//
//  Created by 沈凯 on 2018/5/2.
//  Copyright © 2018年 Ssky. All rights reserved.
//

#import "RedButton.h"

@interface RedButton()

@end

@implementation RedButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.width / 2;
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint redPoint = [self convertPoint:point toView:self.button];
    if ([self.button pointInside:redPoint withEvent:event]) {
        return self.button;
    }else {
        return [super hitTest:point withEvent:event];
    }
}
@end
