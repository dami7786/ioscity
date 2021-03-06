//
//  TouZiZhiNanCell.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "TouZiZhiNanCell.h"

@interface TouZiZhiNanCell ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation TouZiZhiNanCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc]init];
        
        [self.contentView addSubview:_imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}
-(void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    _imageView.image = [UIImage imageNamed:_imageName];
}

@end
