//
//  LeftViewCell.h
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSInteger const KLeftViewCellDefaultHeiht;

@interface LeftViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *headIamgeView;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,assign)NSInteger index;

@end
