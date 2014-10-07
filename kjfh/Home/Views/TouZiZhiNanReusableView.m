//
//  TouZiZhiNanReusableView.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "TouZiZhiNanReusableView.h"

@interface TouZiZhiNanReusableView ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation TouZiZhiNanReusableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc]init];
        self.imageView.image = [UIImage imageNamed:@"shujia"];
        [self addSubview:_imageView];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

@end
