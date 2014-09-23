//
//  UIImage+XCarExtend.h
//
//

#import <UIKit/UIKit.h>

@interface UIImage (XCarExtend)

/**
 *  根据给定的颜色生成1x1的图片
 *
 *  @param color 颜色
 *
 *  @return 生成的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  生成模糊图片
 *
 *  @param blurAmount 模糊量（0.0~1.0）
 *
 *  @return 返回模糊图片
 */
- (UIImage *)blurredImage:(CGFloat)blurAmount;

@end