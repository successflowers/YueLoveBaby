//
//  ZJNetWorking.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  业务操作回调函数
 *
 *  @param isSucessed 操作是否成功
 *  @param outParam   操作的输出参数
 *  @param eMsg       操作错误信息    （当操作成功时为nil）
 */
typedef void (^BusinessOperationCallback)(BOOL isSucessed,id outParam,NSString *eMsg);

@interface ZJNetWorking : NSObject

+ (instancetype)sharedInstance;
- (void)getResponseDataWithUrl:(NSString *)urlStr parameter:(NSDictionary*) parameters callBack:(BusinessOperationCallback)callBack;


@end
