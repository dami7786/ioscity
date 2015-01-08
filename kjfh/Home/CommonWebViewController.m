//
//  CommonWebViewController.m
//  XCar6
//
//  Created by ZhangAimin on 14/11/30.
//  Copyright (c) 2014年 爱卡汽车. All rights reserved.
//

#import "CommonWebViewController.h"

@interface CommonWebViewController ()<UIWebViewDelegate, UIActionSheetDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *moreButton;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UIButton *closeButton;
@property (nonatomic,assign) BOOL showCloseButton;
@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;
@end


@implementation CommonWebViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initNav];
    [self commonInit];
//    [self reloadNavItems];
    [self themeChangedNotification:nil];
    
    if (self.documentName) {
        NSString *path = [[NSBundle mainBundle] pathForResource:self.documentName ofType:nil];
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }else{
        //加载请求
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.requestUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15];
        [self.webView loadRequest:request];
    }
}

-(void)initNav{
    //标题
    _titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = RGB(66, 66, 66);
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.text = self.navTitle;
    [self.titleLabel sizeToFit];
    self.navigationItem.titleView = _titleLabel;
    
//    self.closeButton =  [self createButtonWithTitle:@"关闭"];
//    [self.closeButton addTarget:self  action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.backButton =  [self createButtonWithTitle:@"返回"];
//    [self.backButton setImage:[UIImage imageNamed:@"heiye_news_fanhui"] forState:UIControlStateNormal];
//    if (IOS7_OR_LATER) {
//        self.backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
//        self.backButton.titleEdgeInsets = UIEdgeInsetsZero;
//    }
//    [self.backButton sizeToFit];
//    [self.backButton addTarget:self  action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}
//-(UIButton *)createButtonWithTitle:(NSString *)title{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    //    button.frame = CGRectMake(0.0f, 0.0f, 60.0f, 44.0f);
//    [button setTitle:title forState:UIControlStateNormal];
//    button.titleLabel.font = [UIFont systemFontOfSize:16];
//    [button sizeToFit];
//    return button;
//}

-(void)commonInit{
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.scalesPageToFit = YES;
    self.webView.scrollView.decelerationRate = 1;
    self.webView.opaque = NO;
    self.webView.backgroundColor = [UIColor clearColor];
    self.webView.delegate = self;
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_webView];
    
    self.indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.indicatorView];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.view);
    }];
}

//-(void)reloadNavItems{
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:self.backButton];
//    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc]initWithCustomView:self.closeButton];
//    UIBarButtonItem *moreItem = [[UIBarButtonItem alloc]initWithCustomView:self.moreButton];
//    if (self.showCloseButton) {
//        self.navigationItem.leftBarButtonItems  = @[backItem,closeItem];
//    }else{
//        self.navigationItem.leftBarButtonItem = backItem;
//    }
//    self.navigationItem.rightBarButtonItem = moreItem;
//}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    webView.hidden = NO;
    [self.indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.indicatorView stopAnimating];
    if (!self.showCloseButton) {
        self.showCloseButton = [self.webView canGoBack];
    }
//        [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '200%'"];
    
 /*
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
  <meta name="format-detection" content="telephone=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  */
    
    [webView stringByEvaluatingJavaScriptFromString:
     @"var tagHead =document.documentElement.firstChild;"
     "var tagMeta = document.createElement(\"meta\");"
     "tagMeta.setAttribute(\"content\", \"telephone=no\");"
     "tagMeta.setAttribute(\"name\", \"format-detection\");"
     "var tagHeadAdd = tagHead.appendChild(tagMeta);"];
    
    [webView stringByEvaluatingJavaScriptFromString:
     @"var tagHead =document.documentElement.firstChild;"
     "var tagMeta = document.createElement(\"meta\");"
     "tagMeta.setAttribute(\"content\", \"yes\");"
     "tagMeta.setAttribute(\"name\", \"apple-mobile-web-app-capable\");"
     "var tagHeadAdd = tagHead.appendChild(tagMeta);"];
    
    [webView stringByEvaluatingJavaScriptFromString:
     @"var tagHead =document.documentElement.firstChild;"
     "var tagMeta = document.createElement(\"meta\");"
     "tagMeta.setAttribute(\"name\", \"viewport\");"
     "tagMeta.setAttribute(\"content\", \"width=device-width\");"
     "var tagHeadAdd = tagHead.appendChild(tagMeta);"];
    
    //    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.backgroundColor='transparent'"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    if (error.code != kCFURLErrorCancelled) {
        webView.hidden = YES;
        [self.indicatorView stopAnimating];
    }
}
#pragma mark - Action
//-(void)backButtonClicked:(UIButton *)sender{
//    if(self.webView.canGoBack){
//        [self.webView goBack];
//        [self reloadNavItems];
//    }else{
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//}
//
//-(void)closeButtonClicked:(UIButton *)sender{
//    
//    [self.navigationController popViewControllerAnimated:YES];
//}

#pragma mark - Theme

-(void)themeChangedNotification:(NSNotification *)notification{
    
    [self.backButton setTitleColor:[UIColor w_blueColor1] forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor w_blueColor2] forState:UIControlStateHighlighted];
    [self.backButton setImage:[UIImage imageNamed:@"news_fanhui"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"news_fanhui_h"] forState:UIControlStateHighlighted];
    
    [self.closeButton setTitleColor:[UIColor w_blueColor1] forState:UIControlStateNormal];
    [self.closeButton setTitleColor:[UIColor w_blueColor2] forState:UIControlStateHighlighted];
    
    [self.moreButton setTitleColor:[UIColor w_blueColor1] forState:UIControlStateNormal];
    [self.moreButton setTitleColor:[UIColor w_blueColor2] forState:UIControlStateHighlighted];
    self.view.backgroundColor = [UIColor w_grayColorF8];
    self.titleLabel.textColor = [UIColor w_grayColor68];
}

#pragma mark - GC

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
