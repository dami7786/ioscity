//
//  TouXiZhiNanCell.h
//  kjfh
//
//  Created by ZhangAimin on 14/12/27.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouXiZhiNanCellModel;
@interface TouXiZhiNanCell : UITableViewCell

@property (nonatomic,strong) TouXiZhiNanCellModel *model;

@end

@interface TouXiZhiNanCellModel : NSObject
///标题
@property (nonatomic,strong) NSString *title;
///url地址
@property (nonatomic,strong) NSString *url;
@end