//
//  ZaiLuShangViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/6.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "ZaiLuShangViewController.h"
#import "UMSocial.h"
@interface ZaiLuShangViewController ()
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation ZaiLuShangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavBar];
    [self initMain];
    NSString *readmePath = [[NSBundle mainBundle] pathForResource:@"xiegeini.html" ofType:nil];
    NSString *html = [NSString stringWithContentsOfFile:readmePath encoding:NSUTF8StringEncoding error:NULL];
    NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
    NSString *htmlString =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置导航栏
- (void)initNavBar {
    
    //左侧按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [btn addTarget:self  action:@selector(shareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"share_2"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:leftButton animated:NO];
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"写给创业路上的你";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    self.navigationController.navigationBar.tintColor =UIColorFromRGB(0xAB94C2);
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
}

-(void)initMain{
    _webView = [[UIWebView alloc]init];
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Actions
-(void)shareButtonClicked:(UIButton *)sender{
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:nil
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToSms,nil]
                                       delegate:nil];
    
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
-(void)dealloc{
    _webView.delegate = nil;
    _webView.scrollView.delegate = nil;
}

@end
