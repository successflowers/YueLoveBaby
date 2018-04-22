//
//  ZJScrollIndicator.m
//  YueBaby
//
//  Created by 张敬 on 2018/4/19.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJScrollIndicator.h"
@interface ZJScrollIndicator()

@end

@implementation ZJScrollIndicator
#pragma mark - public medthods
- (void)scrollIndicatorMoveWithFrom:(float)from to:(float)to scale:(float)scale callback:(scrollViewIndicatorMoveBlock)callback
{
    CABasicAnimation *scaleAin = nil;
    CABasicAnimation *moveAin = [[CABasicAnimation animation] moveXPositionWithFrom:from to:to];
    if (scale != 1.0) {
        scaleAin = [[CABasicAnimation animation] scaleXByParam:scale];
        CAAnimationGroup *groupAin = [CAAnimationGroup animation];
        groupAin.duration = 0.8;
        groupAin.removedOnCompletion = NO;
        groupAin.fillMode = kCAFillModeForwards;
        groupAin.animations = @[scaleAin,moveAin];
        [self addAnimation:groupAin forKey:@"groupAin"];
    }
    else
    {
        moveAin.duration = 0.5;
        moveAin.removedOnCompletion = NO;
        moveAin.fillMode = kCAFillModeForwards;
        [self addAnimation:moveAin forKey:@"moveAin"];
    }
    callback(@"xxxxxxxxxx");
}

#pragma mark - private medthods

#pragma mark - setter and getter
- (void)setZjScrollIndicatorStyle:(ZJScrollIndicatorStyle)zjScrollIndicatorStyle
{
    if (_zjScrollIndicatorStyle != zjScrollIndicatorStyle) {
        _zjScrollIndicatorStyle = zjScrollIndicatorStyle;
        
        if (zjScrollIndicatorStyle == ZJScrollIndicatorStyleBackground) {
            self.lineCap = kCALineCapRound;
        }
    }
}


@end
