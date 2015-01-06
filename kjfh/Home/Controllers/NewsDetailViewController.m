//
//  NewsDetailViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "MBProgressHUD.h"
#import "UMSocial.h"
@interface NewsDetailViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) UIButton *shareButton;
@property (nonatomic,strong) UIButton *favButton;
@end

@implementation NewsDetailViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF2F1ED);
//    [self initNav];
    [self initMain];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.newsUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [self.webView loadRequest:request];
}

#pragma mark - MakeViews

-(void)initNav{
    
    //分享按钮
    _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shareButton setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [self.shareButton addTarget:self  action:@selector(shareButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton setImage:[UIImage imageNamed:@"share_1"] forState:UIControlStateNormal];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithCustomView:_shareButton];

    //收藏按钮
    _favButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.favButton setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [self.favButton addTarget:self  action:@selector(favButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.favButton setImage:[UIImage imageNamed:@"fav_article"] forState:UIControlStateNormal];
    UIBarButtonItem *favItem = [[UIBarButtonItem alloc]initWithCustomView:_favButton];
    [self.navigationItem setRightBarButtonItems:@[favItem,shareItem] animated:NO];
}

-(void)initMain{
 
    _webView = [[UIWebView alloc]init];
    self.webView.delegate = self;
    self.webView.opaque = NO;
    self.webView.scrollView.decelerationRate = 1;
    self.webView.dataDetectorTypes = UIDataDetectorTypeNone;
    self.webView.scalesPageToFit = YES;
    self.webView.backgroundColor = UIColorFromRGB(0xF2F1ED);
    [self.view addSubview:_webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - Actions

-(void)shareButtonCliked:(UIButton *)sender{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:nil
                                      shareText:[self.webView stringByEvaluatingJavaScriptFromString:@"document.title"]
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToSms,nil]
                                       delegate:nil];
}

-(void)favButtonClicked:(UIButton *)sender{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    self.favButton.enabled = YES;
    self.shareButton.enabled = YES;
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    self.favButton.enabled = YES;
    self.shareButton.enabled = YES;
    [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '200%'"];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.favButton.enabled = NO;
    self.shareButton.enabled = NO;
}

#pragma mark - GC
-(void)dealloc{

    self.webView.delegate = nil;
}

@end
