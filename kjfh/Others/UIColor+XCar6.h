//
//  UIColor+XCar6.h
//  XCar6
//
//  Created by ZhangAimin on 14/9/10.
//  Copyright (c) 2014年 爱卡汽车. All rights reserved.
//

/**
 爱卡汽车6.0中用到的颜色管理类 在项目中经常用到的样色会在此处定义；
 b_## 黑色主题颜色  w_##白色主题颜色
 */

#import <UIKit/UIKit.h>

@interface UIColor (XCar6)

#pragma mark - 白天颜色

/**
 RGB(40,177,229) #28B1E5
 蓝色（导航栏、按钮、tabbar、工具条等）
 @return 颜色值
 */
+(instancetype)w_blueColor1;

/**
 RGB(160,218,240) #A0DAF0
 浅蓝色 （下拉刷新背景、section背景）
 @return 颜色值
 */
+(instancetype)w_blueColor2;

/**
 RBG(160,160,160) #A0A0A0
 灰色160 （字体）
 @return 颜色值
 */
+(instancetype)w_grayColorA0;


/**
 RGB(243,105,31) #F3691F
 
 @return 颜色值
 */
+(instancetype)w_oringeColor;

/**
 RGB() #FFB502
 
 @return 颜色值
 */
+(instancetype)w_yellowColor;

/**
 RGB(255,75,75) #FF4B4B
 
 @return 颜色值
 */
+(instancetype)w_redColor;

/**
 RBG(68,68,68) #444444
 灰色68  （标题字体颜色）
 @return 颜色值
 */
+(instancetype)w_grayColor68; //__deprecated_msg("已经废弃了，可以继续使用");

/**
 RBG(221,221,221) #DDDDDD
 灰色221 （分割线）
 @return 颜色值
 */
+(instancetype)w_grayColorDD;

/**
 RGB(137,137,137) #898989
 
 @return 颜色值
 */
+(instancetype)w_grayColor89;

/**
 RGB(194,194,194) #C2C2C2
 
 @return 颜色值
 */
+(instancetype)w_grayColorC2;

/**
 RGB(235,235,235) #EBEBEB
 
 @return 颜色值
 */
+(instancetype)w_grayColorEB;

/**
 RGB（89,87,87）#595757
 深颜色 字体颜色
 @return 颜色值
 */
+(instancetype)w_darkTextColor;

/**
 RGB(160,160,160) #A0A0A0
 浅颜色  字体颜色
 @return 颜色值
 */
+(instancetype)w_ligthTextColor;

/**
 RGB(239,239,239) #EFEFEF
 Cell选中时的颜色
 
 @return 颜色值
 */
+(instancetype)w_cellSelectedColor;

/**
 RGB(248,248,248) #F8F8F8
 默认背景色
 
 @return 颜色值
 */
+(instancetype)w_grayColorF8;

/**
 RGB(119,194,249) #77C2F9
 性别 男 色值
 @return 颜色值
 */
+(instancetype)w_genderMaleColor;
/**
 RGB(248,128,171) #F880AB
 性别 女 色值
 @return 颜色值
 */
+(instancetype)w_genderFemaleColor;
/**
 *  RGB(240,240,240) #F0F0F0
 *   条件选车背景所用之一
 *  @return 颜色值
 */
+(instancetype)w_grayColorTX;
#pragma mark - 黑夜颜色
/**
 RBG(0,153,211) #0099D3
 黑夜主题 蓝色
 
 @return 颜色值 黑夜
 */
+(instancetype)b_blueColor1;

/**
 RBG(0,141,194) #008dc2
 黑夜主题 蓝色2
 
 @return 颜色值 黑夜
 */
+(instancetype)b_blueColor2;

/**
 RGB(223,108,38) #DF6C26
 
 @return 颜色值
 */
+(instancetype)b_oringeColor;

/**
 RGB(204,158,0) #CC9E00
 
 @return 颜色值
 */
+(instancetype)b_yellowColor;

/**
 RGB(240,43,43) #F02B2B
 
 @return 颜色值
 */
+(instancetype)b_redColor;

/**
 RGB(207,207,207) #CFCFCF
 字体颜色
 
 @return 颜色值 黑夜
 */
+(instancetype)b_grayColorCF;

/**
 RGB(223,223,223) #DFDFDF
 
 @return 颜色值
 */
+(instancetype)b_grayColorDF;

/**
 RGB(91,91,91) #5B5B5B
 
 @return 颜色值
 */
+(instancetype)b_grayColor5B;

/**
 RGB(119,127,138) #777F8A
 小号字体颜色 时间 评论数 等 已读状态字体颜色
 
 @return 字体颜色 灰色
 */
+(instancetype)b_lightTextColor;

/**
 RBG(41,46,54) #292E36
 导航栏 Cell正常状态下背景色
 @return 颜色值 黑色
 */
+(instancetype)b_blackColor1;

/**
 RGB(25,28,34) #191C22
 Cell选中时 背景色
 
 @return 颜色值 黑色
 */
+(instancetype)b_blackColor2;

/**
 RGB(33,37,43) #21252B
 Cell选中时 背景色
 
 @return 颜色值 黑色
 */
+(instancetype)b_blackColor3;

/**
 RGB(104，116，137) #687489
 
 @return 颜色值 灰色
 */
+(instancetype)b_lineColor;

/**
 RGB(173,186,201) #ADBAC9
 字体颜色 未读是字体颜色
 
 @return 颜色值 黑夜
 */
+(instancetype)b_titleColor;

/**
 RGB(14,155,199) #0E9BC7
 性别 男 色值
 @return 颜色值
 */
+(instancetype)b_genderMaleColor;
/**
 RGB(184,78,116) #B84E74
 性别 女 色值
 @return 颜色值
 */
+(instancetype)b_genderFemaleColor;

/**
 RGB(136,146,158) #88929E
 
 @return 颜色值
 */
+(instancetype)b_grayColor1;

/**
 RGB(90,97,106) #5a616a
 
 @return 颜色值
 */
+(instancetype)b_grayColor2;

@end
