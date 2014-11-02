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

@end

@implementation FHQPage3
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"zoujinyuanqu_1"];
        [self addSubview:_imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
