//
//  CABasicAnimation+ZJAnimation.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "CABasicAnimation+ZJAnimation.h"

@implementation CABasicAnimation (ZJAnimation)

- (CABasicAnimation *)scaleXByParam:(float)param
{
    CABasicAnimation *scaleXAin = [CABasicAnimation animation];
    scaleXAin.keyPath = @"transform.scale.x";
    scaleXAin.fromValue = @1.0;
    scaleXAin.toValue = @(param);
    return scaleXAin;
}

//竖直方向移动
- (CABasicAnimation *)moveYPositionWithFrom:(float)from to:(float)to
{
    return [self moveAnimationWithFrom:from to:to diction:@"position.y" isDelay:NO];
}

//水平方向移动
- (CABasicAnimation *)moveXPositionWithFrom:(float)from to:(float)to
{
    return [self moveAnimationWithFrom:from to:to diction:@"position.x" isDelay:NO];
}

- (CABasicAnimation *)moveAnimationWithFrom:(float)from to:(float)to  diction:(NSString *)diction isDelay:(BOOL)isdelay
{
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:diction];
    move.fromValue = @(from);
    move.toValue = @(to);
    move.removedOnCompletion = NO;
    move.fillMode = kCAFillModeForwards;
    return move;
}
@end
