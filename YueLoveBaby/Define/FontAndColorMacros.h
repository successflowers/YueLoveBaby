
//
//  FontAndColorMacros.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/10/26.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

#pragma mark - 颜色
#define KClearColor         [UIColor clearColor]
#define KWhiteColor         [UIColor whiteColor]
#define KBlackColor         [UIColor blackColor]
#define KGrayColor          [UIColor grayColor]
#define KGray2Color         [UIColor lightGrayColor]
#define KBlueColor          [UIColor blueColor]
#define KRedColor           [UIColor redColor]
#define KYellowColor        [UIColor yellowColor]

#define RGB(r,g,b)          RGBA(r,g,b,1.0)
#define RGBA(r,g,b,a)       [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define mRandomColor        RGB(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0)  //随机色生成

#define mMainColor      RGB(249, 67, 153) //下划线颜色
#define mBackgroudColor    RGB(246, 246, 246)
#define mIndicatorBackgroundColor  RGB(89, 203, 253)
#define mSearchBarColor RGB(235, 235, 235)
#define mTarBarSelectedColor RGB(204, 204, 204)
#define mFontColor RGB(51, 51, 51)
#define mIconLineColor RGB(221, 222, 225)
#define mTabBarBackgroundColor RGB(250, 250, 250)


#define pieBackColor RGB(61, 51, 62)
#define pieWordColor RGB(220, 82, 110)
#define pieShadeColor RGB(50, 43, 51)

#pragma mark - 字体
#define mBlodFont(n)[UIFont boldSystemFontOfSize:n]
#define mFontByNameAndSize(name, size)    [UIFont fontWithName:(name) size:(name)]
#define mFont(n) [UIFont systemFontOfSize:n] // 汉字方正准圆简体

#endif /* FontAndColorMacros_h */
