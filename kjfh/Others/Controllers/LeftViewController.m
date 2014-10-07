//
//  LeftViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "LeftViewController.h"

#import "LeftViewCell.h"

#import "HomeViewController.h"

#import "FavrateViewController.h"

#import "TuijianViewController.h"

#import "SetViewController.h"
#import "UIViewController+MMDrawerController.h"

#import "UMFeedback.h"
@interface LeftViewController ()

@property (nonatomic,strong) NSArray *images;

@property (nonatomic,strong) NSArray *titles;

@end

@implementation LeftViewController

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

    self.view.backgroundColor = UIColorFromRGB(0xf2f1ed);
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, StatusBar_HEIGHT + NavigationBar_HEIGHT)];
    tableHeaderView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = tableHeaderView;
}

- (void)didReceiveMemoryWarning{

    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return section == 1 ? 2 : 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cellIdentifier";
    LeftViewCell *cell = (LeftViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[LeftViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.headIamgeView.image = [UIImage imageNamed:self.images[indexPath.section][indexPath.row]];
    cell.titleLabel.text = self.titles[indexPath.section][indexPath.row];
    cell.index = indexPath.row;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KLeftViewCellDefaultHeiht;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 6;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //设置
    if (indexPath.row == 0 && indexPath.section == 2) {
        SetViewController *setViewController =  [[SetViewController alloc]init];
        UINavigationController *setNavController =  [[UINavigationController alloc]initWithRootViewController:setViewController];
        self.mm_drawerController.centerViewController = setNavController;
        [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            
        }];
    }
    //首页
    if (indexPath.row == 0 && indexPath.section == 0) {
        HomeViewController *homeViewController = [[HomeViewController alloc]init];
        UINavigationController *homeNavController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
        self.mm_drawerController.centerViewController = homeNavController;
        [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        }];
    }
    
    //重点企业
    if (indexPath.row == 0 && indexPath.section == 3) {

        [UMFeedback showFeedback:self withAppkey:@"" dictionary:nil];
//        HomeViewController *homeViewController = [[HomeViewController alloc]init];
//        UINavigationController *homeNavController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
//        self.mm_drawerController.centerViewController = homeNavController;
//        [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
//        }];
    }
}

-(NSArray *)images{
    
    if (_images == nil) {
        _images = @[@[@"home.png"],@[@"fav.png",@"application.png"],@[@"set.png"],@[@"qiye.png"]];
    }
    return _images;
}

-(NSArray *)titles{
    
    if (_titles == nil) {
        _titles = @[@[@"首页"],@[@"收藏",@"推荐应用"],@[@"设置"],@[@"重点企业"]];
    }
    return _titles;
}


@end
