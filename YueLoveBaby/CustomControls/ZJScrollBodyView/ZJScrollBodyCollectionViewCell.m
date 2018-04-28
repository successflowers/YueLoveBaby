//
//  ZJScrollBodyCollectionViewCell.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/23.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJScrollBodyCollectionViewCell.h"
#import "MyLayout.h"
#import "ZJScrollTitleBarCell.h"

extern NSString *const  ZJTabBarScrollViewTopNotification;
extern NSString *const  ZJTabBarScrollViewDownNotification;

static NSString *const zjContextCellIndefier = @"zjContextCellIndefier";
static UICollectionViewFlowLayout *layout = nil;
static ZJScrollTitleBarCell*contextCell = nil;
static NSDictionary *dataDic = nil;

@interface ZJScrollBodyCollectionViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableDictionary *cellDic;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@property (nonatomic, strong) NSMutableArray *layouts;

@end
@implementation ZJScrollBodyCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = KWhiteColor;
#warning 别忘了初始化哟
        self.cellDic = [[NSMutableDictionary alloc] init];
        self.layouts = [NSMutableArray new];
        [self addSubview:self.zjContextCollectionView];
        [self action];
        [self yyFPSlabel];
        [self getNetWork];
    }
    return self;
}

- (void)getNetWork
{
    @weakify(self)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @strongify(self)

        for (int i = 1; i <= 7; i++) {
            NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"weibo_%d.json",i]];
            dataDic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            [self.layouts addObject:dataDic[@"statuses"]];
            }
        dispatch_async(dispatch_get_main_queue(), ^{

            [self.zjContextCollectionView reloadData];
        });
    });
}

- (void)yyFPSlabel
{
    _fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = self.height - kWBCellPadding-100;
    _fpsLabel.left = kWBCellPadding;
    _fpsLabel.alpha = 0;
    [self addSubview:_fpsLabel];
}

#pragma mark - scrollview.delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 1;
            NSLog(@"scrollViewWillBeginDragging");
            
        } completion:NULL];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        if (_fpsLabel.alpha != 0) {
            [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.fpsLabel.alpha = 0;
                NSLog(@"scrollViewDidEndDragging");
                
            } completion:NULL];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha != 0) {
        [UIView animateWithDuration:1 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 0;
            NSLog(@"scrollViewDidEndDecelerating");
        } completion:NULL];
    }
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    if (_fpsLabel.alpha == 0) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.fpsLabel.alpha = 1;
            NSLog(@"scrollViewDidScrollToTop");
            
        } completion:^(BOOL finished) {
        }];
    }
}

#pragma  mark - 下拉刷新
- (void)action
{
    self.zjContextCollectionView.mj_header = [ZJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
}

-(void)refresh
{
    NSLog(@"refresh");
    [self.zjContextCollectionView.mj_header endRefreshing];
}

-(void)loadMore
{
    NSLog(@"loadMore");
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _zjContextCollectionView.frame = CGRectMake(0, 0, KScreenWidth, self.frame.size.height);
   
}

#pragma mark - UICollection.delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.layouts.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *array = self.layouts[section];
    return array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 每次先从字典中根据IndexPath取出唯一标识符
    NSString *identifier = [_cellDic objectForKey:[NSString stringWithFormat:@"%@", indexPath]];
    // 如果取出的唯一标示符不存在，则初始化唯一标示符，并将其存入字典中，对应唯一标示符注册Cell
    if (identifier == nil) {
        identifier = [NSString stringWithFormat:@"%@%@", zjContextCellIndefier, [NSString stringWithFormat:@"%@", indexPath]];
        [_cellDic setValue:identifier forKey:[NSString stringWithFormat:@"%@", indexPath]];
        // 注册Cell
        [self.zjContextCollectionView registerClass:[ZJScrollTitleBarCell class]  forCellWithReuseIdentifier:identifier];
    }
    
    ZJScrollTitleBarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];

     NSArray *array = self.layouts[indexPath.section];
    NSString *string = [array[indexPath.item] objectForKey:@"text"];
    
    cell.zjLabel.text = [self.textStr stringByAppendingString:string];
    
    return cell;
}



#pragma mark - collectionViewLayout.delegate
//设置每个item的大小，双数的为50*50 单数的为100*100

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2==0) {
        return CGSizeMake(50, 50);
    }else{
        return CGSizeMake(100, 100);
    }
}
#pragma mark - notification methods
//添加通知方法'
- (void)didMoveToWindow {
    if (self.window) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealScrollPositionTopAction:) name:ZJTabBarScrollViewTopNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealScrollPositionDownAction:) name:ZJTabBarScrollViewDownNotification object:nil];
    }
}

//移除通知方法'
- (void)willMoveToWindow:(UIWindow *)newWindow {
    if (newWindow == nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:ZJTabBarScrollViewTopNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:ZJTabBarScrollViewDownNotification object:nil];
    }
}

- (void)dealScrollPositionTopAction:(NSNotification *)sender
{
    NSIndexPath *aimIndexPath_ = [NSIndexPath indexPathForRow:3 inSection:2];
    [self.zjContextCollectionView scrollToItemAtIndexPath:aimIndexPath_  atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
}

- (void)dealScrollPositionDownAction:(NSNotification *)sender
{
    NSIndexPath *aimIndexPath_ = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.zjContextCollectionView scrollToItemAtIndexPath:aimIndexPath_  atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

#pragma mark - setter and getter
- (void)setTextStr:(NSString *)textStr
{
    if (_textStr != textStr) {
        _textStr = textStr;
    }
    contextCell.zjLabel.text = textStr;
}

- (UICollectionView *)zjContextCollectionView
{
    if (!_zjContextCollectionView) {
        layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumInteritemSpacing = 5.0f;
        layout.minimumLineSpacing = 10.0f;
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
//        MyLayout * layout = [[MyLayout alloc]init];
//        layout.itemCount=100;
        
        _zjContextCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _zjContextCollectionView.delegate = self;
        _zjContextCollectionView.dataSource = self;
        _zjContextCollectionView.backgroundColor = KWhiteColor;
    }
    return _zjContextCollectionView;
}

@end
