//
//  ZJNavBar.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/22.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJNavBar.h"
static float const myNavBarHeight = 32.0f;
static float const myNavBarBtn = 22.0f;
static float const myNavBarOrignX = 10.0f;
static float const myNavBarOrignY = 5.0f;

@interface ZJNavBar()<UITextFieldDelegate>

@end

@implementation ZJNavBar
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 20, KScreenWidth, myNavBarHeight);
        self.backgroundColor = mTabBarBackgroundColor;
        [self addSubview:self.navTextField];
        [self addSubview:self.navQuestionBtn];
        [self.layer addSublayer:self.navLine];
        
    }
    return self;
}

- (void)configTabbar
{

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _navTextField.frame = CGRectMake(myNavBarOrignX,
                                     myNavBarOrignY,
                                     KScreenWidth - myNavBarOrignX*3- myNavBarBtn,
                                     myNavBarHeight - myNavBarOrignY *2);
    _navQuestionBtn.frame = CGRectMake(KScreenWidth - myNavBarBtn - myNavBarOrignX,
                                     myNavBarOrignY,
                                     myNavBarBtn,
                                     myNavBarHeight - myNavBarOrignY *2);
}

#pragma mark - 点击事件处理
- (void)didNavQuestionClicked:(id)sender
{
    NSLog(@"I have some more question!");
}
#pragma mark  - textField.delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.callback) {
        self.callback(YES, _navTextField.text);
    }
}
#pragma mark - setter and getter
- (UITextField *)navTextField
{
    if (!_navTextField) {
        _navTextField= [[UITextField alloc] init];
        _navTextField.borderStyle = UITextBorderStyleNone;
        CAShapeLayer *layer = [CAShapeLayer layer];
        CGRect frame = CGRectMake(0,0,
                                  KScreenWidth - myNavBarOrignX*3- myNavBarBtn,
                                  myNavBarHeight - myNavBarOrignY *2);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:5];
        layer.path = path.CGPath;
        layer.fillColor = mSearchBarColor.CGColor;
        [_navTextField.layer addSublayer:layer];
        _navTextField.secureTextEntry = NO; //密码
        _navTextField.delegate = self;
        _navTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _navTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _navTextField.returnKeyType = UIReturnKeyDone;
        _navTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _navTextField.placeholder = @"宝宝口粮大集结";
        _navTextField.delegate = self;
        _navTextField.font = mFont(11);
        UIImageView *searchImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sns_home_search_icon.png"]];
        searchImg.frame = CGRectMake(0, 0, 22, 22);
        _navTextField.leftView = searchImg;
        _navTextField.leftViewMode = UITextFieldViewModeAlways;
        _navTextField.backgroundColor = mTabBarBackgroundColor;
        [_navTextField setValue:mFontColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    return _navTextField;
}

- (UIButton *)navQuestionBtn
{
    if (!_navQuestionBtn) {
        _navQuestionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     
        [_navQuestionBtn setImage:[UIImage imageNamed:@"member_message_pull.png"] forState:UIControlStateNormal];
       // NSLog(@"*******  %@ ###### \n",NSStringFromCGRect(_navQuestionBtn.imageView.frame));
        _navQuestionBtn.imageEdgeInsets = UIEdgeInsetsMake(-14, -16, -12,-12 );
        _navQuestionBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
       // NSLog(@"*******  %@ ###### \n",NSStringFromCGRect(_navQuestionBtn.imageView.frame));

        [_navQuestionBtn addTarget:self action:@selector(didNavQuestionClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _navQuestionBtn;
}

- (CAShapeLayer *)navLine
{
    if (!_navLine) {
        _navLine = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, myNavBarHeight-0.5, KScreenWidth, 0.5)];
        _navLine.path = path.CGPath;
        _navLine.fillColor = mIconLineColor.CGColor;
    }
    return _navLine;
}

@end
