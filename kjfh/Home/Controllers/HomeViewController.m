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
    
     [self setupLeftMenuButton];
}

- (void)setupLeftMenuButton {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    
    [btn addTarget:self  action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];

    [btn setImage:[UIImage imageNamed:@"set_btn"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    [self.navigationItem setLeftBarButtonItem:leftButton animated:YES];
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
