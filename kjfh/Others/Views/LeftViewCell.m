//
//  LeftViewCell.m
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "LeftViewCell.h"

NSInteger const KLeftViewCellDefaultHeiht = 45;

const NSInteger KSpace8 = 8;

@interface LeftViewCell()

@property (nonatomic,strong)UIImageView *holderView;

@property (nonatomic,strong)UIView *sepLine;

@end

@implementation LeftViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _holderView = [[UIImageView alloc]init];
//        self.holderView.image = [UIImage imageNamed:@"set_cell_bg_single"];
        self.holderView.layer.borderWidth = 0.5;
        self.holderView.layer.borderColor = UIColorFromRGB(0xC6C6C6).CGColor;
        self.holderView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.holderView];
        
        //自动布局
        [self.holderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(KSpace8);
            make.right.equalTo(self.contentView.right).offset(-KSpace8);
            make.top.equalTo(self.contentView.top);
            make.bottom.equalTo(self.contentView.bottom);
        }];
        //图片
        _headIamgeView = [[UIImageView alloc]init];
        self.headIamgeView.contentMode = UIViewContentModeCenter;
        self.headIamgeView.backgroundColor = [UIColor clearColor];
        [self.holderView addSubview:self.headIamgeView];
        [self.headIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.holderView);
            make.left.equalTo(self.holderView).offset(KSpace8);
        }];

        //标题
        _titleLabel = [[UILabel alloc]init];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.textColor = UIColorFromRGB(0x666666);
        [self.holderView addSubview:self.titleLabel];

        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.holderView);
            make.left.equalTo(self.headIamgeView.mas_right).offset(KSpace8);
        }];

        
    }
    return self;
}

-(void)setIndex:(NSInteger)index{
    _index = index;
    if (_index != 0 && _sepLine == nil) {
        _sepLine = [[UIView alloc]initWithFrame:CGRectMake(0, -1, _holderView.frame.size.width, 1)];
        _sepLine.backgroundColor = [UIColor redColor];
        [self.holderView addSubview:_sepLine];
    }
    _sepLine.hidden = _index == 0;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
    [super setHighlighted:highlighted animated:animated];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
