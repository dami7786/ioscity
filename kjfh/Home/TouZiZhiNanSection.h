//
//  TouZiZhiNanSection.h
//  kjfh
//
//  Created by ZhangAimin on 14/12/27.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  TouZiZhiNanSectionModel;
@interface TouZiZhiNanSection : UITableViewHeaderFooterView

@property (nonatomic,strong) TouZiZhiNanSectionModel *model;

@end

@interface TouZiZhiNanSectionModel : NSObject

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSArray *items;

@end
