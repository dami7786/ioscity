//
//  AppDelegate.m
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LeftViewController.h"
#import "MMDrawerController.h"
#import "MobClick.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaHandler.h"



#define UmengAppkey @"542b74e9fd98c5486b02aeee"

@interface AppDelegate ()

@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//    [self startMotiontor];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    LeftViewController *leftViewController = [[LeftViewController alloc]init];
    HomeViewController *homeViewController = [[HomeViewController alloc]init];
    UINavigationController *homeNavController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
//    self.drawerController = [[MMDrawerController alloc]initWithCenterViewController:homeNavController leftDrawerViewController:leftViewController];
    
//    [self.drawerController setMaximumRightDrawerWidth:200.0];
//    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
//    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
//    [self.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController,MMDrawerSide drawerSide, CGFloat percentVisible) {
//     }];
//    self.window.rootViewController = self.drawerController;
    self.window.rootViewController = homeNavController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self customAppearance];
    
    return YES;
}
-(void)startMotiontor{
    //友盟统计
    [MobClick startWithAppkey:UmengAppkey reportPolicy:BATCH channelId:nil];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
    [MobClick setLogEnabled:YES];
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:UmengAppkey];
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
    [UMSocialQQHandler setQQWithAppId:@"1103265165" appKey:@"3ATRMi4YeUCOyImx" url:@"http://www.umeng.com/social"];
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。若在新浪后台设置我们的回调地址，“http://sns.whalecloud.com/sina2/callback”，这里可以传nil ,需要 #import "UMSocialSinaHandler.h"
    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];  
}

-(void)customAppearance{
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    UIImage *image = [UIImage imageWithColor:UIColorFromRGB(0xffffff)];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    //返回按钮样式
    if (IOS7_OR_LATER) {
//        [[UINavigationBar appearance] setTintColor:[UIColor c_darkTextColor]];
        [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
        [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];

        
    }else{
//        [[UINavigationBar appearance] setTintColor:[UIColor c_darkTextColor]];
    }
}

//分享回调方法
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}

#pragma mark - 屏幕旋转

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    
    if (_shouldAutorate) {
        
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }else{
        
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
