//
//  ZhongDianQiYeDetail.m
//  kjfh
//
//  Created by ZhangAimin on 14/12/28.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "ZhongDianQiYeDetail.h"
#import "ZhongDianQiYeModel.h"

@interface ZhongDianQiYeDetail ()

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UITextView *contentTextView;
@property (nonatomic,strong) UIImageView *markImage;
@property (nonatomic,strong) UIButton *ziXunButton;
@property (nonatomic,strong) UIView *sepLine;

@end

@implementation ZhongDianQiYeDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self commonInit];
}

-(void)commonInit{
    
    self.contentView = [[UIView alloc]init];
    self.contentView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.shadowOpacity = 3;
    self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
    self.contentView.layer.shadowRadius = 2;
    [self.view addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(8, 8, 8, 8));
    }];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text = self.model.title;
    self.titleLabel.textColor = UIColorFromRGB(0x95C33C);
    self.titleLabel.backgroundColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView);//.offset(10);
        make.trailing.equalTo(self.contentView);//.offset(-10);
        make.top.equalTo(self.contentView);
        make.height.equalTo(@60);
    }];
    
    self.markImage = [[UIImageView alloc]init];
    self.markImage.image = [UIImage imageNamed:@"zhongdianqiye_mark"];
    [self.contentView addSubview:self.markImage];
    [self.markImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self.contentView);
    }];
    
    self.sepLine = [[UIView alloc]init];
    self.sepLine.backgroundColor = [UIColor w_grayColorDD];
    [self.contentView addSubview:self.sepLine];
    [self.sepLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.leading.trailing.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];
    
//    self.ziXunButton = [[UIButton alloc]init];
//    self.ziXunButton.layer.cornerRadius = 4;
//    self.ziXunButton.layer.masksToBounds = YES;
//    [self.ziXunButton addTarget:self action:@selector(ziXunButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.ziXunButton setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x99C940)] forState:UIControlStateNormal];
//    [self.ziXunButton setTitle:@"入园咨询" forState:UIControlStateNormal];
//    [self.contentView addSubview:self.ziXunButton];
//    [self.ziXunButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.contentView).offset(-5);
//        make.leading.equalTo(self.contentView).offset(5);
//        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(80, 30)]);
//    }];
    
    self.contentTextView = [[UITextView alloc]init];
    self.contentTextView.contentInset = UIEdgeInsetsMake(5, 0, 10, 0);
    self.contentTextView.textColor = [UIColor w_darkTextColor];
    self.contentTextView.font = [UIFont systemFontOfSize:15];
    self.contentTextView.editable = NO;
    self.contentTextView.alwaysBounceVertical = YES;
    self.contentTextView.text = self.model.contentStr;
    [self.contentView addSubview:self.contentTextView];

    [self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sepLine.mas_bottom);
//        make.bottom.equalTo(self.ziXunButton.mas_top).offset(3);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.leading.trailing.equalTo(self.contentView);
    }];

}

#pragma mark - Action

-(void)ziXunButtonClicked:(UIButton *)sender{
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
