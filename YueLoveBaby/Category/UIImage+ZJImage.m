//
//  UIImage+ZJImage.m
//  YueLoveBaby
//
//  Created by 张敬 on 2018/4/21.
//  Copyright © 2018年 张敬. All rights reserved.
//

#import "UIImage+ZJImage.h"

@implementation UIImage (ZJImage)
#pragma mark - 根据颜色和大小得到一张图片
+ (UIImage *)getImageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    CGContextFillRect(ctx, frame);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
