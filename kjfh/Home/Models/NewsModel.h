//
//  NewsModel.h
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *img;
//@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *link;
@property (nonatomic,assign) BOOL hot;
@end
