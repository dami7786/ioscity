//
//  main.m
//  kjfh
//
//  Created by ZhangAimin on 14/9/9.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        [NBSAppAgent startWithAppID:@"7e9c794ce3434385bfb72167df9e2c1f"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
