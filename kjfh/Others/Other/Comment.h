//
//  Comment.h
//  XCar6
//
//  Created by 张爱民 on 14/9/7.
//  Copyright (c) 2014年 爱卡汽车. All rights reserved.
//

#pragma mark - 颜色定义
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) /255.0f alpha:(a)]
#define RGB(r,g,b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) /255.0f alpha:1.0]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0f green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0f blue:((float)(rgbValue & 0xFF)) /255.0f alpha:1.0]

#pragma mark - 设备定义
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen]currentMode].size):NO)
#pragma mark - 系统版本号
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define IOS7_OR_LATER (([[[UIDevice currentDevice] systemVersion]floatValue] >= 7.0)?(YES):(NO))

#pragma mark - 尺寸定义
#define NavigationBar_HEIGHT 44
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define StatusBar_HEIGHT ((IOS7_OR_LATER && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1)?20.f:0.f)
#pragma mark - 日志
#ifdef DEBUG
#   define Dlog(fmt, ...) NSLog((@"%s[Line %d]",fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS);
#else
#   define Dlog(...)
#endif

#pragma mark - 弧度角度转换
#define degressToRadian(x) (M_PI*(x) / 180.0)
#define radianToDegress(radian) ((radian*180.0)/(M_PI))


