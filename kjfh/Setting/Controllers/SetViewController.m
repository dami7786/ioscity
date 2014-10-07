//
//  SetViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "SetViewController.h"
#import "UIViewController+MMDrawerController.h"
@interface SetViewController ()

@end

@implementation SetViewController
 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavBar];
}

//设置导航栏
- (void)initNavBar {
    
    //左侧按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [btn addTarget:self  action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"back_btn2.png"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftButton animated:YES];
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"设置";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - Actions
-(void)leftDrawerButtonPress:(UIButton *)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft
                                      animated:YES
                                    completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
