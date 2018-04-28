//
//  ZJTabBar.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJTabBar.h"
#import "ZJTabBarItem.h"

 NSString *const  ZJTabBarScrollViewTopNotification = @"ZJTabBarScrollViewTopNotification";
 NSString *const  ZJTabBarScrollViewDownNotification = @"ZJTabBarScrollViewDownNotification";

static float const myTabBarHeight = 40.0f;

@interface ZJTabBar()
@property (nonatomic, strong) UIControl *photoItem;
/** 当前选中的按钮 */
@property (nonatomic, strong) ZJJumpIndicator *jumpIndicator;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *tabbarNomalImageArr;
@property (nonatomic, strong) NSArray *tabbarSelectedImageArr;
@property (nonatomic, strong) ZJTabBarItem *firstItem;
@property (nonatomic, strong) ZJTabBarItem *selectedItem;

@property (nonatomic, strong) CAShapeLayer *line;
@end

@implementation ZJTabBar
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, KScreenHeight - myTabBarHeight, KScreenWidth, myTabBarHeight);
        self.backgroundColor = mTabBarBackgroundColor;
        [self.layer addSublayer:self.line];
        [self addSubview:self.photoItem];
        [self configTabbar];
    }
    return self;
}

- (void)configTabbar
{
    float gap = KScreenWidth/15.0;
    for (int i = 0; i< self.titleArr.count; i++) {
        
        CGRect frame = CGRectMake(gap+3*gap*i, 0, gap, myTabBarHeight);
        ZJTabBarItem *item = [[ZJTabBarItem alloc] initWithFrame:frame];
        item.tag = i;
        [self addSubview:item];
        if (i == 0) {
            item.hidden = YES;
            self.firstItem = item;
        }
        [item setTabbarText:self.titleArr[i]];
        [item setTabbarIcon:self.tabbarNomalImageArr[i]];
        [item addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    /*
     for (int i = 0; i<5; i++) {
     
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     btn.frame = CGRectMake(gap+3*gap*i, 0, gap, myTabBarHeight);
     //btn.backgroundColor = KRedColor;
     btn.tag = i;
     [self addSubview:btn];
     if (i==0) {
     btn.hidden = YES;
     self.firstBtn = btn;
     }
     [btn setTitle:self.titleArr[i] forState:UIControlStateNormal];
     [btn setImage:self.tabbarNomalImageArr[i] forState:UIControlStateNormal];
     [btn setImage:self.tabbarSelectedImageArr[i] forState:UIControlStateSelected];
     [btn setTitleColor:KGray2Color forState:UIControlStateNormal];
     btn.titleLabel.font = mFont(10);
     btn.imageEdgeInsets = UIEdgeInsetsMake(4, 0, 16,1.333 );
     btn.titleEdgeInsets = UIEdgeInsetsMake(0, -21, -10,0 );
     btn.titleLabel.backgroundColor = KGray2Color;
     
     NSLog(@"*******  %@ ###### %@\n",NSStringFromCGRect(btn.imageView.frame),NSStringFromCGRect(btn.titleLabel.frame));
     
     [btn addTarget:self action:@selector(didClicked:) forControlEvents:UIControlEventTouchUpInside];
     }
     */
    [self addSubview:self.jumpIndicator];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - 点击事件处理
- (void)didClicked:(ZJTabBarItem *)sender
{
    self.selectedItem.selected = NO; // 上一个按钮取消选中
    [self.selectedItem setTabbarIcon:self.tabbarNomalImageArr[self.selectedItem.tag]];
    sender.selected = YES; // 当前按钮设置选中
    self.selectedItem.tabbarTitleLayer.foregroundColor = mFontColor.CGColor;
    [sender setTabbarIcon:self.tabbarSelectedImageArr[sender.tag]];
    sender.tabbarTitleLayer.foregroundColor = mMainColor.CGColor;
    self.selectedItem = sender; // 当前按钮赋值给selectedBtn
    
    if (sender.tag !=0 ) {
        _jumpIndicator.hidden = YES;
        _firstItem.hidden = NO;
    }
    else{
        _jumpIndicator.hidden = NO;
        _firstItem.hidden = YES;
    }
    
    if (self.block) {
        self.block((int)sender.tag);
    }
    
    NSLog(@"点击第%d个按钮",(int)sender.tag);
}

#pragma mark - setter and getter
- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[@"首页",@"分类",@"蜜芽圈",@"购物车",@"我的"];
    }
    return _titleArr;
}

- (NSArray *)tabbarNomalImageArr
{
    if (!_tabbarNomalImageArr) {
        UIImage *image0 = [UIImage imageNamed:@"homepage_tabbar_home_normal.png"]  ;
        UIImage *image1 = [UIImage imageNamed:@"homepage_tabbar_category_normal.png"];
        UIImage *image2 = [UIImage imageNamed:@"homepage_tabbar_group_normal.png"] ;
        UIImage *image3 = [UIImage imageNamed:@"homepage_tabbar_cart_normal.png"];
        UIImage *image4 = [UIImage imageNamed:@"homepage_tabbar_me_normal.png"] ;
        _tabbarNomalImageArr = @[image0,image1,image2,image3,image4];
    }
    return _tabbarNomalImageArr;
}

- (NSArray *)tabbarSelectedImageArr
{
    if (!_tabbarSelectedImageArr) {
        UIImage *img0 = [UIImage imageNamed:@"homepage_tabbar_home_selected.png"];
        UIImage *img1 = [UIImage imageNamed:@"homepage_tabbar_category_selected.png"];
        UIImage *img2 = [UIImage imageNamed:@"homepage_tabbar_group_selected.png"] ;
        UIImage *img3 = [UIImage imageNamed:@"homepage_tabbar_cart_selected.png"];
        UIImage *img4 = [UIImage imageNamed:@"homepage_tabbar_me_selected.png"] ;
        _tabbarSelectedImageArr = @[img0,img1,img2,img3,img4];
    }
    return _tabbarSelectedImageArr;
}
- (ZJJumpIndicator *)jumpIndicator
{
    if (!_jumpIndicator) {
        float gap = KScreenWidth/15.0;
        CGRect frame = CGRectMake(gap/2.0, 2, myTabBarHeight - 4, myTabBarHeight - 4);
        _jumpIndicator = [[ZJJumpIndicator alloc] initWithFrame:frame];
        _jumpIndicator.backColor = [UIColor colorWithRed:249/225.0 green:67/225.0 blue:153/225.0 alpha:1.0];
        _jumpIndicator.imageTop = [UIImage imageNamed:@"home_recommend_up.png"];
        _jumpIndicator.imageDown = [UIImage imageNamed:@"home_recommend_down.png"];
        _jumpIndicator.animationTime = 0.5f;
        _jumpIndicator.stateTopBlock = ^{
            NSLog(@"top");
            [[NSNotificationCenter defaultCenter] postNotificationName:ZJTabBarScrollViewTopNotification object:nil];

        };
        _jumpIndicator.stateDownBlock = ^{
            NSLog(@"down");
            [[NSNotificationCenter defaultCenter] postNotificationName:ZJTabBarScrollViewDownNotification object:nil];
        };
    }
    return _jumpIndicator;
}

- (CAShapeLayer *)line
{
    if (!_line) {
        _line = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, KScreenWidth, 0.5)];
        _line.path = path.CGPath;
        _line.fillColor = mIconLineColor.CGColor;
    }
    return _line;
}

@end
