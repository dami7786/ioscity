//
//  NewsCell.h
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

#define NewsCellDefualtHeight 80

@interface NewsCell : UITableViewCell

@property (nonatomic,strong)  NewsModel *model;

@end
