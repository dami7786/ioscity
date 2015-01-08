//
//  FHQPage2.m
//  kjfh
//
//  Created by ZhangAimin on 14/11/2.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "FHQPage2.h"

@interface FHQPage2 ()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UITextView *textView;
@end

@implementation FHQPage2
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    
    _imageView = [[UIImageView alloc]init];
    _imageView.image = [UIImage imageNamed:@"fuhuaqi_2"];
    [self addSubview:_imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.backgroundColor = [UIColor redColor];

    
    _textView = [[UITextView alloc]init];
    self.textView.text = @"\tHi，您好，我是西户科技创新园的小昭，请让我为您介绍一下我们的园区吧！西安西户科技创新园位于户县县城东南，规划建设面积9平方公里。园区整体建成后，将聚集300家大中型企业，培育和孵化高科技中小微企业数千家，培育20家有全国品牌影响力的电子信息、节能环保、生物医药、现代农业等重点高科技创新企业。";
    self.textView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.2];
    self.textView.alwaysBounceVertical = YES;
    self.textView.font = [UIFont systemFontOfSize:16];
    self.textView.textColor = [UIColor whiteColor];
    self.textView.editable = NO;
    [self addSubview:_textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.height.equalTo(@150);
    }];

}

@end
