//
//  NewsCell.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"
@interface NewsCell()
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *hotFlag;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *contentHolder;

@end

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _contentHolder = [[UIImageView alloc]init];
        self.contentHolder.backgroundColor = [UIColor whiteColor];
        self.contentHolder.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//        self.contentHolder.layer.shadowOffset = CGSizeMake(3, 3);
        self.contentHolder.layer.shadowOpacity = 2;
        [self.contentView addSubview:_contentHolder];
        
        UIEdgeInsets inset = UIEdgeInsetsMake(2,7,2,7);
        [_contentHolder mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(inset);
        }];
        
        _hotFlag = [[UIImageView alloc]init];
        self.hotFlag.image = [UIImage imageNamed:@"hot"];
        self.hotFlag.hidden = YES;
        [self.contentHolder addSubview:_hotFlag];
        [_hotFlag mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_contentHolder.bottom).offset(-2);
            make.right.equalTo(_contentHolder.right).offset(-2);
            make.width.equalTo(@44);
            make.height.equalTo(@44);
        }];
        
        _headImageView = [[UIImageView alloc]init];
        [self.contentHolder addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_contentHolder.left).offset(2);
            make.top.equalTo(_contentHolder.top).offset(2);
            make.bottom.equalTo(_contentHolder.bottom).offset(-2);
            make.width.equalTo(@120);
        }];
        
        _titleLabel = [[UILabel alloc]init];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = UIColorFromRGB(0x666666);
        [self.contentHolder addSubview:_titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_headImageView.right).offset(4);
            make.right.equalTo(_contentHolder.right).offset(-4);
            make.top.equalTo(_contentHolder.top).offset(4);
        }];
        
        self.backgroundColor = UIColorFromRGB(0xF2F1ED);
    }
    return self;
}

-(void)setModel:(NewsModel *)model{
 
    _model = model;
    
    self.titleLabel.text = model.title;

    self.hotFlag.hidden = !model.hot;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
