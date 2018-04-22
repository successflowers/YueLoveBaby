//
//  ZJScrollTitleBar.m
//  YueBaby
//
//  Created by 张敬 on 2018/4/19.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJScrollTitleBar.h"
#import "ZJScrollIndicator.h"
#import "ZJScrollTitleBarCell.h"
//#import "NSString+YYAdd.h"

static NSString *const cellIndefier = @"cellIndefier";
static UICollectionViewFlowLayout *layout = nil;
static NSArray *layouts = nil;
@interface ZJScrollTitleBar()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) ZJScrollIndicator *zjScrollIndicator;
@property (nonatomic, strong) UICollectionView *zjCollectionView;
@property (nonatomic, strong) UIBezierPath *zjPath;
@end

@implementation ZJScrollTitleBar
//全能初始化方法
- (instancetype) initWithTitle:(NSArray *)titleArr
{
    self = [super init];
    if (self) {
        _zjTiltleArray = titleArr;
        layouts = @[@"40",@"40",@"40",@"40",@"90",@"80",@"80",@"40",
                           @"80",@"80",@"80",@"80",@"80",@"80",@"40",@"50"];
        
        [self addSubview:self.zjCollectionView];
        _zjScrollIndicator = [ZJScrollIndicator layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 33, 100, 2)];
        _zjScrollIndicator.path = path.CGPath;
        _zjScrollIndicator.fillColor = [UIColor redColor].CGColor;
        [self.layer addSublayer:_zjScrollIndicator];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _zjCollectionView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}


#pragma mark - UICollection.delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _zjTiltleArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZJScrollTitleBarCell *scrollTitleBarCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndefier forIndexPath:indexPath];
    scrollTitleBarCell.zjLabel.text = _zjTiltleArray[indexPath.item];
    scrollTitleBarCell.zjLabel.font = [UIFont fontWithName:@"FZY3JW--GB1-0" size:12];;
    scrollTitleBarCell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
                                                          green:arc4random()%255/255.0
                                                           blue:arc4random()%255/255.0  alpha:1.0];
    return scrollTitleBarCell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_zjScrollIndicator scrollIndicatorMoveWithFrom:0 to:200 scale:0.3 callback:^(NSString *scale) {
        NSLog(@"%@",scale);
    }];
}
#pragma mark - collectionViewLayout.delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int w = [layouts[indexPath.item] intValue];
    return (CGSize){100,self.frame.size.height};
}

#pragma mark - private methods
#pragma mark - setter methods
//Bar.style
- (void)setZjBarStyle:(ZJScrollTitleBarStyle)zjBarStyle
{
    if (_zjBarStyle !=zjBarStyle) _zjBarStyle = zjBarStyle;
    
    if (_zjBarStyle == ZJScrollTitleBarStyleHorizontal) {
        _zjScrollIndicator.zjScrollIndicatorStyle = ZJScrollIndicatorStyleLine;
    }else
    {
    }
}

#pragma mark - getermethods
- (UICollectionView *)zjCollectionView
{
    if (!_zjCollectionView) {
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0.5f;
        _zjCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _zjCollectionView.delegate = self;
        _zjCollectionView.dataSource = self;
        _zjCollectionView.backgroundColor = [UIColor orangeColor];
        
        [_zjCollectionView registerClass:[ZJScrollTitleBarCell class] forCellWithReuseIdentifier:cellIndefier];
    }
    return _zjCollectionView;
}
/*
- (ZJScrollIndicator *)zjScrollIndicator
{
    if (!_zjScrollIndicator) {
        _zjScrollIndicator = [ZJScrollIndicator layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 33, 100, 2)];
        _zjScrollIndicator.path = path.CGPath;
        _zjScrollIndicator.fillColor = [UIColor redColor].CGColor;
    }
    return _zjScrollIndicator;
}
 */
@end
