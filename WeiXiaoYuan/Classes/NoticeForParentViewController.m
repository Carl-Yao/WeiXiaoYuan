//
//  NoticeViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "NoticeForParentViewController.h"
#import "BackButton.h"
#import "JsInterface.h"
#import "Notify.h"
@implementation NoticeForParentViewController
-(void)InitFunctionView
{
    super.functionTitle = @"家校互动";
    super.htmlDirectory = @"www/model/Notify";
    super.htmlName = @"notifyQuery.html";
    JsInterface* interface = [JsInterface new];
    [self.viewcontroller addJavascriptInterfaces:interface WithName:@"JsInterface"];
    Notify* notify = [Notify new];
    [self.viewcontroller addJavascriptInterfaces:notify WithName:@"Notify"];
}

@end
