//
//  TouZiZhiNanSectionView.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/25.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "TouZiZhiNanDecorationView.h"

@interface TouZiZhiNanDecorationView ()
@property (nonatomic,strong) UIImageView *imageView;
@end


@implementation TouZiZhiNanDecorationView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc]init];
        
        [self addSubview:_imageView];
        self.imageView.image = [UIImage imageNamed:@"shujia"];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

@end
