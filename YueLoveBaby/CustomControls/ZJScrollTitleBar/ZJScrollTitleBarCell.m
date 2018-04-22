//
//  ZJScrollTitleBarCell.m
//  YueBaby
//
//  Created by 张敬 on 2018/4/19.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "ZJScrollTitleBarCell.h"

@implementation ZJScrollTitleBarCell

- (UILabel *)zjLabel
{
    if (!_zjLabel) {
       
        _zjLabel = [[UILabel alloc] init];
        _zjLabel.frame = self.bounds;
       // _zjLabel.backgroundColor = [UIColor yellowColor];
        _zjLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_zjLabel];
    }
    return _zjLabel;
}

@end
