//
//  HomeViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "HomeViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "UMSocial.h"
#import "ZaiLuShangViewController.h"
#import "ZouJinYuanQuViewController.h"
#import "XinWenViewController.h"
#import "FuHuaQiViewController.h"
#import "ZhongDianQiYeViewController.h"
#import "TouZiZhiNanViewController.h"
@interface HomeViewController ()<UINavigationControllerDelegate>

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavBar];
    
    [self initMainView];
}
//设置导航栏
- (void)initNavBar {
    
    //左侧按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [btn addTarget:self  action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"set_btn"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftButton animated:YES];
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"西户科创园";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}
//设置主视图
-(void)initMainView{
    NSInteger padding = 10;
    //第一个视图
    UIButton *button1 = [[UIButton alloc]init];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIImageView *button1_imageView = [[UIImageView alloc]init];
    button1_imageView.image = [UIImage imageNamed:@"toyou.jpg"];
    [button1 addSubview:button1_imageView];
    [button1_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(button1);
    }];
    
    //第二个视图
    UIButton *button2 = [[UIButton alloc]init];
    button2.tag = 2;
    button2.backgroundColor = UIColorFromRGB(0xF7DC2F);
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
    
    UIImageView *button2_imageView = [[UIImageView alloc]init];
    button2_imageView.image = [UIImage imageNamed:@"image"];
    [button2 addSubview:button2_imageView];
    [button2_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button2.centerX);
        make.centerY.equalTo(button2.centerY).offset(-10);
    }];
    UILabel *button2_titleLabel = [[UILabel alloc]init];
    button2_titleLabel.textAlignment = NSTextAlignmentCenter;
    button2_titleLabel.text = @"走进园区";
    button2_titleLabel.font = [UIFont systemFontOfSize:16];
    button2_titleLabel.textColor = UIColorFromRGB(0xFFFFFF);
    [button2 addSubview:button2_titleLabel];
    [button2_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button2.centerX);
        make.top.equalTo(button2_imageView.bottom);//.offset(padding);
    }];
    
    //第三个视图
    UIButton *button3 = [[UIButton alloc]init];
    button3.tag = 3;
    button3.backgroundColor = UIColorFromRGB(0xAB93C4);
    [button3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIImageView *button3_imageView = [[UIImageView alloc]init];
    button3_imageView.image = [UIImage imageNamed:@"news"];
    [button3 addSubview:button3_imageView];
    [button3_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button3.centerX);
        make.centerY.equalTo(button3.centerY).offset(-10);
    }];
    
    UILabel *button3_tileLabel = [[UILabel alloc]init];
    button3_tileLabel.textAlignment = NSTextAlignmentCenter;
    button3_tileLabel.text = @"新闻";
    button3_tileLabel.font = [UIFont systemFontOfSize:16];
    button3_tileLabel.textColor = UIColorFromRGB(0xFFFFFF);
    [button3 addSubview:button3_tileLabel];
    [button3_tileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button3.centerX);
        make.bottom.equalTo(button3.bottom).offset(-5);
    }];
    
    //第四个视图
    UIButton *button4 = [[UIButton alloc]init];
    button4.tag = 4;
    button4.backgroundColor = UIColorFromRGB(0xF07685);
    [button4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIImageView *button4_imageView = [[UIImageView alloc]init];
    button4_imageView.image = [UIImage imageNamed:@"zhinan"];
    [button4 addSubview:button4_imageView];
    [button4_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button4.centerX);
        make.centerY.equalTo(button4.centerY).offset(-10);
    }];
    
    UILabel *button4_tileLabel = [[UILabel alloc]init];
    button4_tileLabel.textAlignment = NSTextAlignmentCenter;
    button4_tileLabel.text = @"投资指南";
    button4_tileLabel.font = [UIFont systemFontOfSize:16];
    button4_tileLabel.textColor = UIColorFromRGB(0xFFFFFF);
    [button4 addSubview:button4_tileLabel];
    [button4_tileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button4.centerX);
        make.top.equalTo(button4_imageView.bottom);//.offset(padding);
    }];
    
    //第五个视图
    UIButton *button5 = [[UIButton alloc]init];
    button5.tag = 5;
    button5.backgroundColor = UIColorFromRGB(0x51C2CC);
    [button5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    UIImageView *button5_imageView = [[UIImageView alloc]init];
    button5_imageView.image = [UIImage imageNamed:@"home_btn_5.png"];
    [button5 addSubview:button5_imageView];
    [button5_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(button5.left).offset(8);
        make.centerY.equalTo(button5.centerY);
    }];
    
    UILabel *button5_titleLabel = [[UILabel alloc]init];
    button5_titleLabel.textAlignment = NSTextAlignmentCenter;
    button5_titleLabel.text = @"西户科技企业孵化器";
    button5_titleLabel.font = [UIFont systemFontOfSize:16];
    button5_titleLabel.textColor = UIColorFromRGB(0xFFFFFF);
    [button5 addSubview:button5_titleLabel];
    [button5_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(button5.right).offset(-padding);
        make.centerY.equalTo(button5.centerY);
    }];
    
    //第六个视图
    UIButton *button6 = [[UIButton alloc]init];
    button6.tag = 6;
    button6.backgroundColor = UIColorFromRGB(0x94C92E);
    [button6 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UILabel *button6_titleLabel = [[UILabel alloc]init];
    button6_titleLabel.textAlignment = NSTextAlignmentCenter;
    button6_titleLabel.text = @"重点企业";
    button6_titleLabel.font = [UIFont systemFontOfSize:16];
    button6_titleLabel.textColor = UIColorFromRGB(0xFFFFFF);
    [button6 addSubview:button6_titleLabel];
    [button6_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button6.center);
    }];
    
    
    //自动布局
    UIView *superView = self.view;
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.top.equalTo(superView.mas_top).offset(padding);
        make.height.equalTo(superView.height).multipliedBy(0.35);
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(superView.mas_left).offset(padding);
        make.width.equalTo(superView.width).with.offset(-30).multipliedBy(0.5);
        make.top.equalTo(button1.bottom).offset(10);
        make.height.equalTo(superView.height).multipliedBy(0.25);
        
    }];
    
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(superView.mas_left).offset(padding);
        make.width.equalTo(superView.width).with.offset(-30).multipliedBy(0.5);
        make.top.equalTo(button2.bottom).offset(10);
        make.height.equalTo(superView).multipliedBy(0.17);
    }];
    
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(button1.bottom).offset(10);
        make.left.equalTo(button2.right).offset(10);
        make.right.equalTo(superView.right).offset(-padding);
        make.bottom.equalTo(button3.bottom);
    }];
    
    [button5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button4.bottom).offset(padding);
        make.bottom.equalTo(superView.bottom).offset(-padding);
        make.left.equalTo(superView.left).offset(padding);
        make.width.equalTo(superView.width).with.offset(-30).multipliedBy(0.75);
    }];
    
    [button6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button4.bottom).offset(padding);
        make.bottom.equalTo(superView.bottom).offset(-padding);
        make.right.equalTo(superView.right).offset(-padding);
        make.left.equalTo(button5.right).offset(padding);
    }];
    
    
}

#pragma mark - Button Handlers
- (void)leftDrawerButtonPress:(id)sender {
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft
                                      animated:YES
                                    completion:nil];
}

-(void)buttonClicked:(UIButton *)sender{
    
    //    UIViewController *viewController = [[UIViewController alloc]init];
    //    viewController.view.backgroundColor = [UIColor whiteColor];
    //    [self.navigationController pushViewController:viewController animated:YES];
    UIViewController *controller = nil;
    switch (sender.tag) {
        case 1:
            controller = [[ZaiLuShangViewController alloc]init];
            break;
        case 2:
            controller = [[ZouJinYuanQuViewController alloc]init];
            break;
        case 3:
            controller = [[XinWenViewController alloc]init];
            break;
        case 4:
            controller = [[TouZiZhiNanViewController alloc]init];
            break;
        case 5:
            controller = [[FuHuaQiViewController alloc]init];
            break;
        case 6:
            controller = [[ZhongDianQiYeViewController alloc]init];
            break;
    }
    
    [self.navigationController pushViewController:controller animated:YES];
    self.navigationController.delegate = self;
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self) {
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
