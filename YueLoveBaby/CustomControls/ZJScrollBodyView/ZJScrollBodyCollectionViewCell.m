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
static NSString *const zjContextCellIndefier = @"zjContextCellIndefier";
static UICollectionViewFlowLayout *layout = nil;
static ZJScrollTitleBarCell*contextCell = nil;

@interface ZJScrollBodyCollectionViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableDictionary *cellDic;

@end
@implementation ZJScrollBodyCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = KWhiteColor;
#warning 别忘了初始化哟
        self.cellDic = [[NSMutableDictionary alloc] init];
        [self addSubview:self.zjContextCollectionView];
        [self action];
    }
    return self;
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
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
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

    
    cell.zjLabel.text = self.textStr;
    
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
//        _zjContextCollectionView.showsVerticalScrollIndicator = NO;
//        _zjContextCollectionView.showsHorizontalScrollIndicator = NO;
//        _zjContextCollectionView.pagingEnabled = YES;
      //  [_zjContextCollectionView registerClass:[ZJScrollTitleBarCell class] forCellWithReuseIdentifier:zjContextCellIndefier];
    }
    return _zjContextCollectionView;
}

@end
