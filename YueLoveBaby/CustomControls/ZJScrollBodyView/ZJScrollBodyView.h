//
//  ZJScrollBodyView.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/23.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^scrollBodyViewBlock)(int oldPath , int  newPath); //单元格选择响应回调

@interface ZJScrollBodyView : UIView
@property (nonatomic, strong, readonly) NSArray *zjTiltleArray; //数据源
@property (nonatomic, copy) scrollBodyViewBlock  block;

//全能初始化方法
- (instancetype) initWithTitle:(NSArray *)titleArr;
@end
