//
//  FHQPage4.m
//  kjfh
//
//  Created by ZhangAimin on 14/11/2.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "FHQPage4.h"

@interface FHQPage4 ()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UITextView *textView;

@end

@implementation FHQPage4
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
              
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"fuhuaqi_4"];
        [self addSubview:_imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.backgroundColor = [UIColor redColor];
        
        
        _textView = [[UITextView alloc]init];
        self.textView.text = @"\t来西户科科技企业孵化器，创业不愁钱，不愁资源！\n\t为入孵企业提供创业投资、创业辅导、公司治理辅导、上市辅导等针对性服务，给科技企业成长提供强有力的支撑；\n\t孵化器成立投融资公司，为中小微企业提供无息或低息贷款，优先股，让创业不愁钱；\n\t智慧化管理，建立大型的综合服务平台站群系统及数据中心，云服务就在身边；\n\t科技成果展示中心，有效整合入孵企业资源，提高科技成果转化效率；\n\t节能环保服务贯穿始终，孵化器采用智慧能源监控系统、智能LED照明系统、智能安全指示系统，为企业节省每一分钱;";
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
    return self;
}
@end
