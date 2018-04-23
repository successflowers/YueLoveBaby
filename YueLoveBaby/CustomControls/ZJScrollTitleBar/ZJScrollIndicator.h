//
//  ZJScrollIndicator.h
//  YueBaby
//
//  Created by 张敬 on 2018/4/19.
//  Copyright © 2018年 张敬. All rights reserved.
//
/*
 1.滚动标题栏（可定制的）ZJScrollTitleBar  （uiCollective）
 
 样式（横/竖）
 
 布局  （size origin 定点  center）
 
 每个cell之间的间隙
 
 数据源  ————  字体颜色（选择/未选择）  字体   字体大小—>每一个cell的宽度
 
 背景色（选择/未选择）
 
 跟踪显示标签  路径 定点 中心点  颜色          形状 （背景/线条/圆圈/其他）
 
 操作的根据（block/delegate）
 */
#import <QuartzCore/QuartzCore.h>
typedef NS_ENUM(NSUInteger, ZJScrollIndicatorStyle)
{
    ZJScrollIndicatorStyleLine = 100,    // 线条
    ZJScrollIndicatorStyleCircle,        //圆圈
    ZJScrollIndicatorStyleBackground,    //背景
};


@interface ZJScrollIndicator : CAShapeLayer

@property (nonatomic) ZJScrollIndicatorStyle zjScrollIndicatorStyle; //样式

- (void)scrollIndicatorMoveWithFrom:(float)from to:(float)to scale:(float)scale;



@end
