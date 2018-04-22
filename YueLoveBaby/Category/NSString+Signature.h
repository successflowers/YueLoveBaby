//
//  NSString+Signature.h
//  CP-Fitness
//
//  Created by 张敬 on 2017/11/17.
//  Copyright © 2017年 Jing Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Signature)
/*
 1.1.    签名算法
 1）将请求中所有参数按字母先后顺序排序（去掉数组类型字段，如上传运动数据中的datas字段）；
 2）把所有参数名和参数值串在一起；
 3）调用HMAC SHA256算法，根据提供的密钥（secret）和密文（message）输出密文摘要，并把结果转换为小写形式的十六进制字符串。
 算法示例：
 appkey：100004
 secret：83af706573907c3800ffa0a53b6afd2f
 第一步：例如原API接口参数如下
 {"id":1, "length":50}
 第二步：加上timestamp=<当前UTC时间>，appkey=<你的APPKEY>，token，得到：
 id=1
 length=50
 appkey=100004
 timestamp=2016-04-05T06:38:13Z
 token=aabbccee333224rrrwrzre8
 然后把所有参数名称按字母先后顺序排列：
 appkey=100004
 id=1
 length=50
 timestamp=2016-04-05T06:38:13Z
 token=aabbccee333224rrrwrzre8
 第三步：把所有参数连接起来，去掉=和&符号
 appkey100004id1length50timestamp2016-04-05T06:38:13Ztokenaabbccee333224rrrwrzre8
 第四步：对上述字符串使用secret作为key进行HMAC SHA256摘要算法，即得sign值，转换为小写
 sign=c25f9ac7a745eeb40e4b6fff31e496b393d1ab048c11ce611de592eca3dc2d97
 Authorization=coolplay-auth-v1/100004/2016-04-05T06:38:13Z/c25f9ac7a745eeb40e4b6fff31e496b393d1ab048c11ce611de592eca3dc2d97
 */
+ (NSString *)signatureWithAppKey:(NSString *)appKey
                           secret:(NSString *)secret
                        parameter:(NSDictionary *)parameter
                            token:(NSString *)token;

@end
