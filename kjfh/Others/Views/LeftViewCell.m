//
//  LeftViewCell.m
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "LeftViewCell.h"

NSInteger const KLeftViewCellDefaultHeiht = 42;

const NSInteger KSpace8 = 8;

@interface LeftViewCell()

@property (nonatomic,strong)UIView *holderView;

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
        
        _holderView = [[UIView alloc]initWithFrame:CGRectMake(KSpace8, 0, SCREEN_WIDTH - 2 * KSpace8 - 40, KLeftViewCellDefaultHeiht)];

        _holderView.layer.borderWidth = 1;
        
        _holderView.layer.borderColor = [UIColorFromRGB(0xc6c6c6) CGColor];
        
        _holderView.backgroundColor = [UIColor whiteColor];
        
        _holderView.layer.shadowRadius = 3;
        
        [self.contentView addSubview:_holderView];
        
        _headIamgeView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KLeftViewCellDefaultHeiht, KLeftViewCellDefaultHeiht)];

        _headIamgeView.contentMode = UIViewContentModeCenter;
        
        _headIamgeView.backgroundColor = [UIColor clearColor];
        
        [self.holderView addSubview:_headIamgeView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, _holderView.frame.size.width - 100, KLeftViewCellDefaultHeiht)];
        
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
        _titleLabel.textColor = UIColorFromRGB(0x666666);
        
        [self.holderView addSubview:_titleLabel];
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
