//
//  ZhengCeViewController.h
//  kjfh
//
//  Created by ZhangAimin on 14/12/27.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhengCeViewController : UIViewController{
    NSString *_navTitle;
}
@property (nonatomic,strong) NSString *navTitle;
@property (nonatomic,strong) NSString *file;
@property (nonatomic,assign) BOOL showSection;
@end
