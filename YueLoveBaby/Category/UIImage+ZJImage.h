//
//  UIImage+ZJImage.h
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZJImage)
#pragma mark - 根据颜色和大小得到一张图片
+ (UIImage *)getImageWithColor:(UIColor *)color size:(CGSize)size;
@end
