//
//  FHQPage3.m
//  kjfh
//
//  Created by ZhangAimin on 14/11/2.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "FHQPage3.h"

@interface FHQPage3 ()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *sepLine;
@property (nonatomic,strong) UITextView *textView;

@end

@implementation FHQPage3
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"fuhuaqi_3_2"];
        [self addSubview:_imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
        }];
        
        _iconImageView = [[UIImageView alloc]init];
        self.iconImageView.image = [UIImage imageNamed:@"fuhuaqi_3_1"];
        [self addSubview:_iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView.mas_bottom).offset(5);
            make.left.equalTo(self.mas_left).offset(15);
        }];
        
        _titleLabel = [[UILabel alloc]init];
        self.titleLabel.text = @"厂区鸟瞰图";
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
        self.textView.text = @"\tHi，您好！我是西户科技创新园的小昭，请允许我为您介绍一下园区的龙头与创新源头——西户科技企业孵化器。\n\t西户科技企业孵化器建筑面积约10万平方米，秉承“每栋建筑都是传世作品，每点服务都做到极致“的理念，向中小微企业提供集研发、设计、办公、生产、物流于一体的综合平台，配以齐全的配套设施和优良的物业环境.";
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
