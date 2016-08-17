//
//  WordButton.m
//  题型二demo
//
//  Created by pxh on 16/8/17.
//  Copyright © 2016年 裴新华. All rights reserved.
//

#import "WordButton.h"

@implementation WordButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)click{
    UIWindow* keyWindow       = [UIApplication sharedApplication].keyWindow;
    UILabel* label            = [[UILabel alloc]initWithFrame:self.frame];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius  = CGRectGetHeight(label.frame) * 0.5;
    label.textAlignment       = NSTextAlignmentCenter;
    label.text                = self.titleLabel.text;
    [label setBackgroundColor:[UIColor redColor]];
    [keyWindow addSubview:label];
    [UIView animateWithDuration:kDuration animations:^{
        //位移
        CABasicAnimation* position = [CABasicAnimation animationWithKeyPath:@"position"];
        position.fromValue         = [NSValue valueWithCGPoint:CGPointMake(self.frame.origin.x, self.frame.origin.y)];
        position.toValue           = [NSValue valueWithCGPoint:CGPointMake(20, 50)];
        position.duration          = kDuration;
        position.timingFunction    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        [label.layer addAnimation:position forKey:@"positionAnimation"];
        //缩放
        label.transform            = CGAffineTransformMakeScale(0.1, 0.1);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((kDuration - 0.15) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
    });
    [self setHidden:YES];
}

-(void)animationShow{
    UIWindow* keyWindow       = [UIApplication sharedApplication].keyWindow;
    UILabel* label            = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, self.frame.size.width, self.frame.size.height)];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius  = CGRectGetHeight(label.frame) * 0.5;
    label.textAlignment       = NSTextAlignmentCenter;
    label.text                = self.titleLabel.text;
    [label setBackgroundColor:[UIColor redColor]];
    //缩放
    label.transform           = CGAffineTransformMakeScale(0.1, 0.1);
    [keyWindow addSubview:label];
    [UIView animateWithDuration:kDuration animations:^{
        //位移
        CABasicAnimation* position = [CABasicAnimation animationWithKeyPath:@"position"];
        position.fromValue         = [NSValue valueWithCGPoint:CGPointMake(20, 50)];
        position.toValue           = [NSValue valueWithCGPoint:CGPointMake(self.frame.origin.x, self.frame.origin.x)];
        position.duration          = kDuration;
        position.timingFunction    = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        [label.layer addAnimation:position forKey:@"positionAnimation"];
        //缩放
        label.transform            = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((kDuration - 0.15) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
        [self setHidden:NO];
    });
}

@end
