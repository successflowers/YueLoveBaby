//
//  CABasicAnimation+ZJAnimation.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CABasicAnimation (ZJAnimation)
- (CABasicAnimation *)scaleXByParam:(float)param;
//竖直方向移动
-(CABasicAnimation *)moveYPositionWithFrom:(float)from to:(float)to;

//水平方向移动
- (CABasicAnimation *)moveXPositionWithFrom:(float)from to:(float)to;

- (CABasicAnimation *)moveAnimationWithFrom:(float)from to:(float)to  diction:(NSString *)diction isDelay:(BOOL)isdelay;
@end
