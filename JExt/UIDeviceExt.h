//
//  UIDevice+Ext.h
//  JExt
//
//  Created by Mr_Jia on 2017/7/24.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Ext)

/**
 获取设备平台

 @return 返回设备平台
 */
+ (NSString *)ang_platform;


/**
 获取设备名称字符串

 @return 返回设备名称字符串
 */
+ (NSString *)ang_platformString;

/**
 获取设备macAddress

 @return 返回设备macAddress
 */
+ (NSString *)ang_macAddress;

/**
 获取设备CPU频率

 @return 返回设备CPU频率
 */
+ (NSUInteger)ang_cpuFrequency;

/**
 获取当前设备总线频率

 @return 返回当前设备总线频率
 */
+ (NSUInteger)ang_busFrequency;

/**
 获取当前设备内存大小

 @return 返回当前设备内存大小
 */
+ (NSUInteger)ang_ramSize;

/**
 获取设备当前CPU使用率

 @return 返回设备当前CPU使用率
 */
+ (NSUInteger)ang_cpuNumber;

/**
 获取iOS系统的版本号

 @return 返回 获取iOS系统的版本号
 */
+ (NSString *)ang_systemVersion;

/**
 判断当前系统是否有摄像头

 @return 返回判断当前系统是否有摄像头
 */
+ (BOOL)ang_hasCamera;

/**
 获取手机内存总量

 @return 返回的是字节数
 */
+ (NSUInteger)ang_totalMemoryBytes;

/**
 获取手机可用内存,

 @return  返回的是字节数
 */
+ (NSUInteger)ang_freeMemoryBytes;


/**
 获取手机硬盘空闲空间


 @return 返回的是字节数
 */
+ (long long)ang_freeDiskSpaceBytes;

/**
 获取手机硬盘总空间,

 @return  返回的是字节数
 */
+ (long long)ang_totalDiskSpaceBytes;
@end
