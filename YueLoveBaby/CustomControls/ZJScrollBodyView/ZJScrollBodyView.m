//
//  ZJScrollBodyView.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/23.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJScrollBodyView.h"
#import "ZJScrollBodyCollectionViewCell.h"

extern NSString *const ZJScrollTitleSendMessageNotification;

static NSString *const zjCellIndefier = @"zjCellIndefier";
static UICollectionViewFlowLayout *layout = nil;
static NSArray *layouts = nil;
static int newPathRow = 0; //指向那个具体的view
static int oldPathRow = 0;

@interface ZJScrollBodyView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *zjBodyCollectionView;
@property (nonatomic, strong) NSMutableDictionary *cellDic;
@end

@implementation ZJScrollBodyView
//全能初始化方法
- (instancetype) initWithTitle:(NSArray *)titleArr
{
    self = [super init];
    if (self) {
        _zjTiltleArray = titleArr;
        self.cellDic = [[NSMutableDictionary alloc] init];
        [self addSubview:self.zjBodyCollectionView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _zjBodyCollectionView.frame = CGRectMake(0, 0, KScreenWidth, self.frame.size.height);
    layout.itemSize = CGSizeMake(KScreenWidth, self.frame.size.height);
}


 #pragma mark - scrollView.delegate
 - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
 {
      newPathRow = scrollView.contentOffset.x/KScreenWidth;
     if (self.block) {
         self.block(oldPathRow,newPathRow);
     }
     oldPathRow = newPathRow;
}


#pragma mark - UICollection.delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _zjTiltleArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 每次先从字典中根据IndexPath取出唯一标识符
    NSString *identifier = [_cellDic objectForKey:[NSString stringWithFormat:@"%@", indexPath]];
    // 如果取出的唯一标示符不存在，则初始化唯一标示符，并将其存入字典中，对应唯一标示符注册Cell
    if (identifier == nil) {
        identifier = [NSString stringWithFormat:@"%@%@", zjCellIndefier, [NSString stringWithFormat:@"%@", indexPath]];
        [_cellDic setValue:identifier forKey:[NSString stringWithFormat:@"%@", indexPath]];
        // 注册Cell
        [self.zjBodyCollectionView registerClass:[ZJScrollBodyCollectionViewCell class]  forCellWithReuseIdentifier:identifier];
    }
    
    ZJScrollBodyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
     cell.textStr = _zjTiltleArray[indexPath.item];
    return cell;
}

#pragma mark - collectionViewLayout.delegate
#pragma mark - private methods
#pragma mark - notification methods
//添加通知方法'
- (void)didMoveToWindow {
    if (self.window) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealScrollTitleBarAction:) name:ZJScrollTitleSendMessageNotification object:nil];
    }
}

//移除通知方法'
- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (newWindow == nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:ZJScrollTitleSendMessageNotification object:nil];
    }
}

//通知事件
- (void)dealScrollTitleBarAction:(NSNotification *)sender
{
    NSDictionary *dic = (NSDictionary *)sender.object;
    NSInteger oldPath_ = [dic[@"oldPath"] integerValue];
    NSInteger newPath_ = [dic[@"newPath"] integerValue];
    NSIndexPath *newIndexPath_ = [NSIndexPath indexPathForItem:newPath_ inSection:0];
    
    if (oldPath_<newPath_) {
        [_zjBodyCollectionView scrollToItemAtIndexPath:newIndexPath_  atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }else
    {
        [_zjBodyCollectionView scrollToItemAtIndexPath:newIndexPath_  atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
    }
}

#pragma mark - setter and getter
- (UICollectionView *)zjBodyCollectionView
{
    if (!_zjBodyCollectionView) {
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumInteritemSpacing = 0.0f;
        layout.minimumLineSpacing = 0.0f;
        
        _zjBodyCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _zjBodyCollectionView.delegate = self;
        _zjBodyCollectionView.dataSource = self;
        _zjBodyCollectionView.backgroundColor = KWhiteColor;
        _zjBodyCollectionView.showsVerticalScrollIndicator = NO;
        _zjBodyCollectionView.showsHorizontalScrollIndicator = NO;
        _zjBodyCollectionView.pagingEnabled = YES;
    }
    return _zjBodyCollectionView;
}

@end
