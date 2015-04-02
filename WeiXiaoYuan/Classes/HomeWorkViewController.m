//
//  HomeWorkViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/29.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "HomeWorkViewController.h"
#import "DKScrollingTabController.h"
#import "BackButton.h"
#import "JsInterface.h"
#import "HomeWork.h"
#import "UserManager.h"
@interface HomeWorkViewController ()

@end

@implementation HomeWorkViewController
- (void)InitFunctionView
{
    //son class
    if ([UserManager shareController].UserType == PARENT)
    {
        super.titles = [[NSArray alloc]initWithObjects:@"当日作业",@"作业查询",nil];
        super.htmlNames = [[NSArray alloc]initWithObjects:@"homeworkTodayForParent.html",@"homeworkQueryForParent.html",nil];
    }else{
        super.titles = [[NSArray alloc]initWithObjects:@"作业发布",@"作业查询",nil];
        super.htmlNames = [[NSArray alloc]initWithObjects:@"homeworkPublish.html",@"homeworkQuery.html",nil];
    }
    
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/HomeWork",@"www/model/HomeWork",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPLA",nil];
    super.functionTitle = @"家庭作业";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    HomeWork* homeWork = [HomeWork new];
    [view addJavascriptInterfaces:homeWork WithName:@"HomeWork"];
    [super AddEasyJS:view];
}
@end
