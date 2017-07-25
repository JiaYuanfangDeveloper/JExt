//
//  UIColor+UIColorExt.m
//  JExt
//
//  Created by Mr_Jia on 2017/7/21.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "UIColorExt.h"

@implementation UIColor (UIColorExt)

+ (UIColor *)ang_randomColor {
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}


+ (UIColor *)ang_colorWithHexString:(NSString *)color{
    
    return [self ang_colorWithHexString:color alpha:1.0];
}


+ (UIColor *)ang_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //String should be 6 or 8 Characters
    
    if (cString.length < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾

    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    
    if([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if (cString.length != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r   截取的range = (0,2)
    NSString *rString = [cString substringWithRange:range];
    //g   截取的range = (2,2)
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b   截取的range = (4,2)
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    //将字符串十六进制两位数字转为十进制整数
    unsigned int r, g, b;

    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:alpha];
    
}

+ (UIColor *)ang_gradientFromColor:(UIColor *)startColor endColor:(UIColor *)endColor withHeight:(int)height {
    
    CGSize size = CGSizeMake(1, height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    NSArray *colors = [NSArray arrayWithObjects:(id)startColor.CGColor,(id)endColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace,(__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
    
}
@end
