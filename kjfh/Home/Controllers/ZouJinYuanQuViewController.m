//
//  ZouJinYuanQuViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/6.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "ZouJinYuanQuViewController.h"
#import "ZJYQPage1.h"
#import "ZJYQPage2.h"
#import "ZJYQPage3.h"
#import "ZJYQPage4.h"
#import "ZJYQPage5.h"
@interface ZouJinYuanQuViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation ZouJinYuanQuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF2F1ED);
    [self initNavBar];
    [self setupMain];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//设置导航栏
- (void)initNavBar {
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"走进园区";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    }

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0xF6D994)] forBarMetrics:UIBarMetricsDefault];

}

-(void)setupMain{
    
    _scrollView = [[UIScrollView alloc]init];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView* contentView = [[UIView alloc]init];
    [self.scrollView addSubview:contentView];
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView.height);
    }];
    
    ZJYQPage1 *page1 = [[ZJYQPage1 alloc]init];
    [contentView addSubview:page1];
    [page1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.height);
    }];
    
    ZJYQPage2 *page2 = [[ZJYQPage2 alloc]init];
    [contentView addSubview:page2];
    [page2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page1.right);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.height);
    }];
    
    ZJYQPage3 *page3 = [[ZJYQPage3 alloc]init];
    [contentView addSubview:page3];
    [page3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page2.right);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.height);
    }];

    
    ZJYQPage4 *page4 = [[ZJYQPage4 alloc]init];
    [contentView addSubview:page4];
    [page4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page3.right);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.height);
    }];

    
    ZJYQPage5 *page5 = [[ZJYQPage5 alloc]init];
    [contentView addSubview:page5];
    [page5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page4.right);
        make.width.equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.height);
    }];
    UIView *sizingView = UIView.new;
    [self.scrollView addSubview:sizingView];
    [sizingView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(page5.right);
        make.right.equalTo(contentView.right);
    }];
    
    _pageControl = [[UIPageControl alloc]init];
    self.pageControl.numberOfPages = 5;
    self.pageControl.hidesForSinglePage = YES;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self.view addSubview:_pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = floor(scrollView.contentOffset.x/SCREEN_WIDTH);
    self.pageControl.currentPage = page;
}

@end
