//
//  ZJScrollBodyCollectionViewCell.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/23.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJScrollBodyCollectionViewCell.h"
static NSString *const Identifier = @"Identifier";

@interface ZJScrollBodyCollectionViewCell()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation ZJScrollBodyCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhiteColor;
        [self addSubview:self.mTableView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _mTableView.frame = CGRectMake(0, 0, KScreenWidth, self.frame.size.height);
}

#pragma mark - UITableView.delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    cell.textLabel.text = self.textStr;
    return cell;
}

#pragma mark - setter and getter
- (void) setTextStr:(NSString *)textStr
{
    if (_textStr != textStr) {
        _textStr = textStr;
    }
    [_mTableView reloadData];
}

- (UITableView *)mTableView
{
    if (!_mTableView) {
        _mTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mTableView.delegate = self;
        _mTableView.dataSource = self;
        _mTableView.showsVerticalScrollIndicator = NO;
        _mTableView.showsHorizontalScrollIndicator = NO;
        _mTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        [_mTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    }
    return _mTableView;
}

@end
