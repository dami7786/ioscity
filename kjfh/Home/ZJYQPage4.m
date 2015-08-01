//
//  ZJYQPage4.m
//  kjfh
//
//  Created by ZhangAimin on 14/11/2.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "ZJYQPage4.h"


@interface ZJYQPage4 ()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView  *sepLine;

@end
@implementation ZJYQPage4

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"zoujiyuanqu_4_1"];
        [self addSubview:_imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
        }];
        
        _iconImageView = [[UIImageView alloc]init];
        self.iconImageView.image = [UIImage imageNamed:@"zoujinyuanqu_4_2"];
        [self addSubview:_iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(5);
            make.left.equalTo(self.mas_left).offset(15);
        }];
        
        _titleLabel = [[UILabel alloc]init];
        self.titleLabel.text = @"土地规划图";
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor orangeColor];
        [self addSubview:_titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.iconImageView.mas_centerY);
            make.left.equalTo(self.iconImageView.mas_right).offset(10);
        }];
        
        _sepLine = [[UIView alloc]init];
        self.sepLine.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        [self addSubview:_sepLine];
        [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImageView.mas_bottom).offset(5);
            make.left.equalTo(self.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@0.5);
        }];
     
        _textView = [[UITextView alloc]init];
        self.textView.text = @"\tHi，您好，我是西户科技创新园的小昭，请让我为您介绍一下我们的园区吧！西安西户科技创新园位于户县县城东南，规划建设面积9平方公里。园区整体建成后，将聚集300家大中型企业，培育和孵化高科技中小微企业数千家，培育20家有全国品牌影响力的电子信息、节能环保、生物医药、现代农业等重点高科技创新企业。";
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.alwaysBounceVertical = YES;
        self.textView.font = [UIFont systemFontOfSize:16];
        self.textView.textColor = [UIColor w_darkTextColor];
        self.textView.editable = NO;
        [self addSubview:_textView];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.sepLine.mas_bottom).offset(10);
            make.left.equalTo(self.mas_left).offset(10);
            make.right.equalTo(self.mas_right).offset(-10);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
        }];
        
    }
    return self;
}

@end
