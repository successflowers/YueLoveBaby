//
//  SportCounts.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/27.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "SportCounts.h"
static NSInteger totalNumbers = 0;

@interface SportCounts()
@property (nonatomic, assign) BOOL isReset;  //是否重置
@property (nonatomic, assign) NSInteger oldNum; //蓝牙旧数据
@property (nonatomic, assign) NSInteger newNum; //蓝牙重置后产生的数据
@property (nonatomic, assign) NSInteger totalNum; //总共的数据
@property (nonatomic, assign) NSInteger times; //重置的次数

@end

@implementation SportCounts

- (void)getSportCounts:(NSInteger)orignNum isReset:(BOOL)isReset   block:(reSetCallBackNumBlock)block
{
    totalNumbers += orignNum;
    if (isReset) {
        
    }
}


@end
