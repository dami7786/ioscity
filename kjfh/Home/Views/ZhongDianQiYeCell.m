//
//  ZhongDianQiYeCell.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "ZhongDianQiYeCell.h"

@interface ZhongDianQiYeCell()
@property (nonatomic,strong) UIView *holderView;
@property (nonatomic,strong) UIImageView *flagView;
@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation ZhongDianQiYeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _holderView = [[UIView alloc]init];
        self.holderView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.holderView.layer.shadowOpacity = 3;
        self.holderView.layer.shadowOffset = CGSizeMake(3, 3);
        self.holderView.layer.shadowRadius = 2;
        self.holderView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_holderView];
        [self.holderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
            make.left.equalTo(self.contentView.mas_left).offset(4);
            make.right.equalTo(self.contentView.mas_right).offset(-4);
        }];
        
        _flagView = [[UIImageView alloc]init];
        [self.holderView addSubview:_flagView];
        [self.flagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.holderView.mas_left);
            make.top.equalTo(self.holderView.mas_top);
            make.bottom.equalTo(self.holderView.mas_bottom);
            make.width.equalTo(@5);
        }];
        
        _headImage = [[UIImageView alloc]init];
        self.headImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.holderView addSubview:_headImage];
        [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.flagView.mas_right);
            make.top.equalTo(self.holderView.top);
            make.height.equalTo(self.holderView.height);
            make.width.equalTo(@160);
        }];
        
        _titleLabel = [[UILabel alloc]init];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = UIColorFromRGB(0x666666);
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.holderView addSubview:_titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImage.mas_right).offset(4);
            make.top.equalTo(self.holderView.mas_top).offset(2);
            make.right.equalTo(self.holderView.mas_right).offset(-4);
            make.bottom.equalTo(self.holderView.mas_bottom).offset(-2);
        }];
        
    }
    return self;
}

-(void)setModel:(ZhongDianQiYeModel *)model{
    _model = model;
    self.flagView.image = [UIImage imageWithColor:[UIColor orangeColor]];
    self.headImage.image = [UIImage imageNamed:@"mail"];
    self.titleLabel.text = @"西安优势铁路新技术有限责任公司";
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
