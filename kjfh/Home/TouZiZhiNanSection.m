//
//  TouZiZhiNanSection.m
//  kjfh
//
//  Created by ZhangAimin on 14/12/27.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "TouZiZhiNanSection.h"

@interface TouZiZhiNanSection ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *line;

@end

@implementation TouZiZhiNanSection

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.tintColor = [UIColor w_darkTextColor];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(12);
            make.right.equalTo(self).offset(-12);
            make.top.height.equalTo(self);
        }];
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = [UIColor w_grayColorDD];
        [self.contentView addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.left.equalTo(self).offset(12);
            make.right.equalTo(self).offset(-12);
            make.height.equalTo(@0.5);
        }];
    }
    return self;
}

-(void)setModel:(TouZiZhiNanSectionModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
}

@end

@implementation TouZiZhiNanSectionModel

@end