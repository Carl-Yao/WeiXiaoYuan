//
//  SecondFunctionBaseViewController.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/18.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//  详情页

#import <UIKit/UIKit.h>
#import "EasyJSWebView.h"
#import "BackButton.h"
#import "NotifyBaseViewController.h"
@interface SecondFunctionBaseViewControllerEx : NotifyBaseViewController
@property (strong, nonatomic)EasyJSWebView* viewcontroller;
@property (strong,nonatomic) NSString* htmlName;
@property (strong,nonatomic) NSString* htmlDirectory;
@property (strong,nonatomic) NSString* functionTitle;
-(void)InitFunctionView;
@end
