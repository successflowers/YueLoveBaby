//
//  ZJTabBarItem.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/22.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJTabBarItem.h"
static float const iconWidth = 22.0f;
static float const iconOriginY = 4.0f;
static float const iconFontSize = 9.0f;

@interface ZJTabBarItem ()
@property (nonatomic, strong) CALayer *tabbarImageLayer;
@end

@implementation ZJTabBarItem

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.tabbarImageLayer];
        [self.layer addSublayer:self.tabbarTitleLayer];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    float w = self.frame.size.width;
    _tabbarImageLayer.frame = CGRectMake((w-iconWidth)/2.0, iconOriginY, iconWidth, iconWidth);
    _tabbarTitleLayer.frame = CGRectMake((w-iconWidth*2)/2.0, iconOriginY+iconWidth, iconWidth*2, iconWidth);
}

#pragma mark - setter and getter
- (void)setTabbarIcon:(UIImage *)tabbarIcon
{
    if (_tabbarIcon != tabbarIcon) {
        _tabbarIcon = tabbarIcon;
    }
    _tabbarImageLayer.contents = (__bridge id)tabbarIcon.CGImage;
}

- (void)setTabbarText:(NSString *)tabbarText
{
    if (_tabbarText!= tabbarText) {
        _tabbarText = tabbarText;
    }
    _tabbarTitleLayer.string = tabbarText;
}

- (CALayer *)tabbarImageLayer
{
    if (!_tabbarImageLayer) {
        _tabbarImageLayer = [CALayer layer];
        //_tabbarImageLayer.backgroundColor = KYellowColor.CGColor;
        _tabbarImageLayer.contentsGravity = kCAGravityResizeAspect;
    }
    return _tabbarImageLayer;
}
- (CATextLayer *)tabbarTitleLayer
{
    if (!_tabbarTitleLayer) {
        _tabbarTitleLayer = [CATextLayer layer];
        //_tabbarTitleLayer.backgroundColor = KBlueColor.CGColor;
        _tabbarTitleLayer.fontSize = iconFontSize;
        _tabbarTitleLayer.alignmentMode = kCAAlignmentCenter;
        _tabbarTitleLayer.contentsScale = [UIScreen mainScreen].scale;
        _tabbarTitleLayer.foregroundColor = mFontColor.CGColor;
        _tabbarTitleLayer.contentsGravity = kCAGravityResizeAspect;
    }
    return _tabbarTitleLayer;
}



@end
