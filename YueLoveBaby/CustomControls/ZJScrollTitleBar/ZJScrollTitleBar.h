//
//  ZJScrollTitleBar.h
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
 
 跟踪显示标签  宽度  高度    颜色          形状 （背景/线条/圆圈/其他）
 
 操作的根据（block/delegate）
 */

#import <UIKit/UIKit.h>
@class ZJScrollIndicator;
typedef NS_ENUM(NSUInteger, ZJScrollTitleBarStyle)
{
    ZJScrollTitleBarStyleHorizontal = 0,    //水平
    ZJScrollTitleBarStyleVertical           //竖直
};

typedef void(^scrollTitlebarBlock)(int oldPath , int newPath); //单元格选择响应回调

@interface ZJScrollTitleBar : UIView
@property (nonatomic, strong, readonly) NSArray *zjTiltleArray; //数据源
@property (nonatomic, strong) UIFont *zjFont;                   //字体
@property (nonatomic, strong) UIColor *zjFontColor;             //字体颜色
@property (nonatomic, strong) UIColor *zjFontColorSelected;     //被选择的字体颜色
@property (nonatomic) float zjItemGap;                          //字体间隙
@property (nonatomic, strong) UIColor *zjScrollTitleBarItemBackgroundColor;//ZJScrollTitleBar.cell.backgroundcolor
@property (nonatomic, strong) UIColor *zjScrollTitleBarItemSelectedBackgroundColor;
@property (nonatomic) ZJScrollTitleBarStyle zjBarStyle;
@property (nonatomic, copy) scrollTitlebarBlock  block;
//全能初始化方法
- (instancetype) initWithTitle:(NSArray *)titleArr;

@end
