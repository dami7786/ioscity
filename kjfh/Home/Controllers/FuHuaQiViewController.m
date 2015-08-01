//
//  FuHuaQiViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/6.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "FuHuaQiViewController.h"
#import "FHQPage1.h"
#import "FHQPage2.h"
#import "FHQPage3.h"
#import "FHQPage4.h"
#import "FHQPage5.h"

@interface FuHuaQiViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation FuHuaQiViewController

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
    titleLabel.text = @"西户科技企业孵化器";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
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
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView.mas_height);
    }];
    
    FHQPage1 *page1 = [[FHQPage1 alloc]init];
    [contentView addSubview:page1];
    [page1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.mas_height);
    }];
    
    FHQPage2 *page2 = [[FHQPage2 alloc]init];
    [contentView addSubview:page2];
    [page2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page1.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(contentView.mas_height);
    }];
    
    FHQPage3 *page3 = [[FHQPage3 alloc]init];
    [contentView addSubview:page3];
    [page3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page2.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.mas_height);
    }];
    
    
    FHQPage4 *page4 = [[FHQPage4 alloc]init];
    [contentView addSubview:page4];
    [page4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page3.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.equalTo(contentView.mas_height);
    }];
    
    
    FHQPage5 *page5 = [[FHQPage5 alloc]init];
    [contentView addSubview:page5];
    [page5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(page4.mas_right);
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.equalTo(contentView.mas_height);
    }];
    UIView *sizingView = UIView.new;
    [self.scrollView addSubview:sizingView];
    [sizingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(page5.mas_right);
        make.right.equalTo(contentView.mas_right);
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
