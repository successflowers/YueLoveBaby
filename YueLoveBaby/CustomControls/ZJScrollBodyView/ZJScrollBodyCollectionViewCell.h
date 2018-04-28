//
//  ZJScrollBodyCollectionViewCell.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/23.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJScrollBodyCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UICollectionView *zjContextCollectionView;
@property (nonatomic, strong) NSString *textStr;
@property (nonatomic, strong) UILabel *zjLabel;

@end
