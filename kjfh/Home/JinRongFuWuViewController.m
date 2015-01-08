//
//  JinRongFuWuViewController.m
//  kjfh
//
//  Created by ZhangAimin on 15/1/7.
//  Copyright (c) 2015年 自由开发者. All rights reserved.
//

#import "JinRongFuWuViewController.h"

@interface JinRongFuWuViewController ()
@property (nonatomic,strong) UITextView *textView;
@end

@implementation JinRongFuWuViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self commonInit];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"jinronfuwu" ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    NSDictionary *jiRongDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    self.textView.text = jiRongDic[@"content"];
}

-(void)commonInit{
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"金融服务";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    self.textView = [[UITextView alloc]init];
    self.textView.editable = NO;
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.textColor = [UIColor w_darkTextColor];
    self.textView.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
