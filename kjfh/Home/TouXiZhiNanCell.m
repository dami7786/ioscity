//
//  TouXiZhiNanCell.m
//  kjfh
//
//  Created by ZhangAimin on 14/12/27.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "TouXiZhiNanCell.h"

@interface TouXiZhiNanCell()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIView *selectBG;
@end

@implementation TouXiZhiNanCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor w_darkTextColor];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.numberOfLines = 2;
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(12);
            make.right.equalTo(self.contentView.mas_right).offset(-12);
            make.top.bottom.equalTo(self.contentView);
        }];
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = [UIColor w_grayColorDD];
        [self.contentView addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(12);
            make.right.equalTo(self.contentView).offset(-12);
            make.height.equalTo(@0.5);
        }];
        
        self.selectBG = [[UIView alloc]init];
        self.selectBG.backgroundColor = [UIColor w_cellSelectedColor];
        self.selectedBackgroundView = self.selectBG;
    }
    return self;
}

-(void)setModel:(TouXiZhiNanCellModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.line.backgroundColor = [UIColor w_grayColorDD];
    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    self.line.backgroundColor = [UIColor w_grayColorDD];
}
@end

@implementation TouXiZhiNanCellModel


@end