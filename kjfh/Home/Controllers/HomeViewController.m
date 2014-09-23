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

@interface HomeViewController ()

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

- (void)initNavBar {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    
    [btn addTarget:self  action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setImage:[UIImage imageNamed:@"set_btn"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    [self.navigationItem setLeftBarButtonItem:leftButton animated:YES];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"西户科创园";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

-(void)initMainView{
    
    UIButton *titleButton = [[UIButton alloc]init];
    [titleButton setTitle:@"西户科创园" forState:UIControlStateNormal];
    titleButton.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:titleButton];
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = [UIColor redColor];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc]init];
    button3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button3];
    
    UIButton *button4 = [[UIButton alloc]init];
    button4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button4];
    
    UIButton *button5 = [[UIButton alloc]init];
    button5.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button5];
    
    UIButton *button6 = [[UIButton alloc]init];
    button6.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:button6];
    
    NSInteger padding = 10;
    UIView *superView = self.view;
    
    [titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.top.equalTo(superView.mas_top).offset(padding);
       
//        make.bottom.equalTo(superView.mas_bottom).offset(-padding);
        
         make.height.equalTo(@[button2.height,button4.height]).offset(-padding);
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(button4.left).offset(10);
        make.top.equalTo(titleButton.bottom).offset(10);
        make.height.equalTo(button3.height).offset(10);

    }];
    
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(button4.left).offset(10);
        make.top.equalTo(button3.bottom).offset(10);
        make.height.equalTo(button2.height).offset(10);
    }];
    
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(titleButton.bottom).offset(10);
        make.left.equalTo(button2.right).offset(10);
        make.right.equalTo(superView.right).offset(-padding);
        make.bottom.equalTo(button3.bottom);
        
    }];
    
    
    
}

#pragma mark - Button Handlers
- (void)leftDrawerButtonPress:(id)sender {
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft
                                      animated:YES
                                    completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
