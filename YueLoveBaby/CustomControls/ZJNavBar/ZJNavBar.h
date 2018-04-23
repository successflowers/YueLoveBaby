//
//  ZJNavBar.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/22.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TextFiledCallback)(BOOL isSucessed,NSString *textFiledStr);
@interface ZJNavBar : UIView

@property (nonatomic, strong) UITextField *navTextField;
@property (nonatomic, strong) UIButton *navQuestionBtn;
@property (nonatomic, strong) UIButton *navSearchBtn;
@property (nonatomic, strong) UIButton *navHeadSetBtn;
@property (nonatomic, strong) CAShapeLayer *navLine;
@property (nonatomic, copy) TextFiledCallback callback;

@end
