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

static NSString *const cellIndefier = @"cellIndefier";
static UICollectionViewFlowLayout *layout = nil;
static NSArray *layouts = nil;
static float const cellWidth = 40.0;
static float const cellGap = 10.0;

static float const myScrollTitleBarHeight = 32.0f;
static  NSInteger aimsPathRow; //指向那个具体的view
static  NSIndexPath *oldPath = nil;

@interface ZJScrollTitleBar()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) ZJScrollIndicator *zjScrollIndicator;
@property (nonatomic, strong) UICollectionView *zjCollectionView;
@property (nonatomic, strong) UIBezierPath *zjPath;
@property (nonatomic, strong) CAShapeLayer *scrollTitleBarLine;

@end

@implementation ZJScrollTitleBar
//全能初始化方法
- (instancetype) initWithTitle:(NSArray *)titleArr
{
    self = [super init];
    if (self) {
        self.zjCollectionView.backgroundColor = KWhiteColor;
        _zjTiltleArray = titleArr;
        [self addSubview:self.zjCollectionView];
        [_zjCollectionView.layer addSublayer:self.zjScrollIndicator];
        [self.layer addSublayer:self.scrollTitleBarLine];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _zjCollectionView.frame = CGRectMake(0, 0, KScreenWidth, myScrollTitleBarHeight);
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
    
    if (indexPath.row == aimsPathRow) {
        scrollTitleBarCell.zjLabel.font = mFont(11.5);
        scrollTitleBarCell.zjLabel.textColor = mMainColor;
    }else
    {
        scrollTitleBarCell.zjLabel.font = mFont(11);
        scrollTitleBarCell.zjLabel.textColor = mFontColor;
    }
    return scrollTitleBarCell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    float from = (cellWidth+cellGap) *oldPath.row;
    float to = (cellWidth+cellGap) *indexPath.row;
    [_zjScrollIndicator scrollIndicatorMoveWithFrom:from to:to scale:1.0 ];
    
    if (self.block) {
        self.block((int)oldPath.row, (int)indexPath.row);
    }
    if (to > KScreenWidth -(cellWidth*2) && to>from) {
        [self.zjCollectionView scrollToItemAtIndexPath:indexPath  atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }else
    {
        [self.zjCollectionView scrollToItemAtIndexPath:indexPath  atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    }
    
    aimsPathRow = indexPath.row;
    oldPath = indexPath;
    [_zjCollectionView reloadData];
}
#pragma mark - collectionViewLayout.delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){cellWidth,self.frame.size.height};
}

#pragma mark - private methods
#pragma mark - notification methods
//添加通知方法'
- (void)didMoveToWindow {
    if (self.window) {
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealScrollBodyAction:) name:@"ZJScrollBodyViewSendMessage" object:nil];
    }
}

//移除通知方法'
- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (newWindow == nil) {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ZJScrollBodyViewSendMessage" object:nil];
    }
}

//通知事件
- (void)dealScrollBodyAction:(NSNotification *)sender
{
    NSDictionary *dic = (NSDictionary *)sender.object;
    NSInteger oldPath_ = [dic[@"oldPath"] integerValue];
    
    aimsPathRow = [dic[@"newPath"] integerValue];
    oldPath = [NSIndexPath indexPathForItem:oldPath_ inSection:0];
    NSIndexPath *newIndexPath_ = [NSIndexPath indexPathForItem:aimsPathRow inSection:0];
    
    float from = (cellWidth+cellGap) *[dic[@"oldPath"] integerValue];
    float to = (cellWidth+cellGap) *[dic[@"newPath"] integerValue];
    [_zjScrollIndicator scrollIndicatorMoveWithFrom:from to:to scale:1.0];
    
    if (to > KScreenWidth && to>from) {
         [self.zjCollectionView scrollToItemAtIndexPath:newIndexPath_  atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }else
    {
        [self.zjCollectionView scrollToItemAtIndexPath:newIndexPath_  atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    }
    
    [_zjCollectionView reloadData];
}

#pragma mark - setter and getter
- (UICollectionView *)zjCollectionView
{
    if (!_zjCollectionView) {
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        layout.minimumInteritemSpacing = 0.5f;
        _zjCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _zjCollectionView.delegate = self;
        _zjCollectionView.dataSource = self;
        _zjCollectionView.backgroundColor = KWhiteColor;
        _zjCollectionView.showsVerticalScrollIndicator = NO;
        _zjCollectionView.showsHorizontalScrollIndicator = NO;
        _zjCollectionView.pagingEnabled = YES;

        [_zjCollectionView registerClass:[ZJScrollTitleBarCell class] forCellWithReuseIdentifier:cellIndefier];
    }
    return _zjCollectionView;
}

- (CAShapeLayer *)scrollTitleBarLine
{
    if (!_scrollTitleBarLine) {
        _scrollTitleBarLine = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, myScrollTitleBarHeight-0.5, KScreenWidth, 0.5)];
        _scrollTitleBarLine.path = path.CGPath;
        _scrollTitleBarLine.fillColor = mIconLineColor.CGColor;
    }
    return _scrollTitleBarLine;
}

- (ZJScrollIndicator *)zjScrollIndicator
{
    if (!_zjScrollIndicator) {
        _zjScrollIndicator = [ZJScrollIndicator layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(cellGap/2.0, 28, cellWidth -cellGap, 1.0)];
        _zjScrollIndicator.path = path.CGPath;
        _zjScrollIndicator.fillColor = mMainColor.CGColor;
    }
    return _zjScrollIndicator;
}

@end
