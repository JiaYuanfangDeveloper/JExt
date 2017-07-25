//
//  UIColor+UIColorExt.h
//  JExt
//
//  Created by Mr_Jia on 2017/7/21.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef UIColorHex
#define UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif
@interface UIColor (UIColorExt)

/**
 随机色

 @return 随机色
 */
+ (UIColor *)ang_randomColor;

/**
 从十六进制字符串获取颜色，默认alpha为1

 @param color 十六进制颜色字符串
 @return 十六进制颜色
 */
+ (UIColor *)ang_colorWithHexString:(NSString *)color;

/**
 从十六进制字符串获取颜色

 @param color 十六进制颜色字符串
 @param alpha 透明度 0~1
 @return 十六进制颜色
 */
+ (UIColor *)ang_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
  渐变颜色

 @param startColor 开始颜色
 @param endColor 结束颜色
 @param height 渐变高度
 @return  渐变颜色
 */
+ (UIColor *)ang_gradientFromColor:(UIColor *)startColor endColor:(UIColor *)endColor withHeight:(int)height;
@end
