//
//  ZJHomeViewController.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJHomeViewController.h"

@interface ZJHomeViewController ()
@property (nonatomic, strong) ZJNavBar *navBar;
@property (nonatomic, strong) ZJScrollTitleBar *scrollTitleBar;
@property (nonatomic, strong) ZJScrollBodyView *scrollBodyView;

@property (nonatomic, strong) NSArray *zjTiltleArray;

@end

@implementation ZJHomeViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = mBackgroudColor;
    [self.view addSubview:self.navBar];
    [self.view addSubview:self.scrollBodyView];
    [self.view addSubview:self.scrollTitleBar];
   // [self.view addSubview:self.scrollBodyView];

}

#pragma mark - setter and getter
- (NSArray *)zjTiltleArray
{
    if (!_zjTiltleArray) {
        _zjTiltleArray = @[@"首页",@"甄选",@"全球购",@"婴童",@"童装",@"美妆",@"玩具",@"孕产",
                           @"女装",@"家具"];
    }
    return _zjTiltleArray;
}
- (ZJScrollTitleBar *)scrollTitleBar
{
    NSArray *array = self.zjTiltleArray;
    if (!_scrollTitleBar) {
        _scrollTitleBar = [[ZJScrollTitleBar alloc] initWithTitle:array];
        _scrollTitleBar.frame = CGRectMake(0, 52, KScreenWidth, 30);
        _scrollTitleBar.zjFont = [UIFont systemFontOfSize:18];
        _scrollTitleBar.zjItemGap = 5.0f;
        _scrollTitleBar.zjBarStyle = 0;
        _scrollTitleBar.zjFontColor = [UIColor blueColor];
        _scrollTitleBar.zjFontColorSelected = mMainColor;
        _scrollTitleBar.block = ^(int oldPath, int newPath) {
            NSLog(@" oldPath = %d, new = %d, ",oldPath, newPath);
            NSDictionary *passDic = @{@"oldPath":[NSNumber numberWithInt:oldPath],
                                      @"newPath":[NSNumber numberWithInt:newPath]};
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ZJScrollTitleSendMessage" object:passDic];
        };
    }
    return _scrollTitleBar;
}

- (ZJScrollBodyView *)scrollBodyView
{
    NSArray *array = self.zjTiltleArray;
    if (!_scrollBodyView) {
        _scrollBodyView = [[ZJScrollBodyView alloc] initWithTitle:array];
        _scrollBodyView.frame = CGRectMake(0, 52+30, KScreenWidth, KScreenHeight - (52+30+40));
        _scrollBodyView.block = ^(int oldPath, int newPath) {
            NSLog(@" oldPath = %d, new = %d, ",oldPath, newPath);
            NSDictionary *passDic = @{@"oldPath":[NSNumber numberWithInt:oldPath],
                                      @"newPath":[NSNumber numberWithInt:newPath]};
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ZJScrollBodyViewSendMessage" object:passDic];
        };
    }
    return _scrollBodyView;
}

- (ZJNavBar *)navBar
{
    if (!_navBar) {
        _navBar = [[ZJNavBar alloc] init];
        _navBar.navLine.hidden = YES;
        _navBar.callback = ^(BOOL isSucessed, NSString *textFiledStr) {
            
            NSLog(@"%@", textFiledStr);
        };
    }
    return _navBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
