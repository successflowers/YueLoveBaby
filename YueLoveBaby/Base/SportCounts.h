//
//  SportCounts.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/27.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ reSetCallBackNumBlock)(NSInteger oldNum, NSInteger newNum, NSInteger totalNum, NSInteger times) ;

@interface SportCounts : NSObject



- (void)isResetNum:(BOOL)isReset block:(reSetCallBackNumBlock)block;

@end
