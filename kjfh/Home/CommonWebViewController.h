//
//  CommonWebViewController.h
//  XCar6
//
//  Created by ZhangAimin on 14/11/30.
//  Copyright (c) 2014年 爱卡汽车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonWebViewController : UIViewController
///请求的url
@property (nonatomic,strong) NSString *requestUrl;
///url标题
@property (nonatomic,strong) NSString *navTitle;

@property (nonatomic,strong) NSString *documentName;

@end
