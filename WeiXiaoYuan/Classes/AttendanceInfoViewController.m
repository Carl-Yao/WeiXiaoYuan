//
//  AttendanceInfoViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/29.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "AttendanceInfoViewController.h"
#import "DKScrollingTabController.h"
#import "BackButton.h"
#import "JsInterface.h"
#import "UserManager.h"
#import "CheckAttendan.h"
#import "M.h"
@interface AttendanceInfoViewController ()

@end

@implementation AttendanceInfoViewController
- (void)InitFunctionView
{
    //son class
   
    if ([UserManager shareController].UserType == PARENT)
    {
        super.titles = [[NSArray alloc]initWithObjects:@"当日考勤",@"考勤查询",nil];//,@"请假申请",@"请假查看" ,nil];
        super.htmlNames = [[NSArray alloc]initWithObjects:@"attendanceTodayForParent.html",@"attendanceQueryForParent.html",nil];//]@"parent_request.html",@"parent_watch.html",nil];
        super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/CheckAttendan",@"www/model/CheckAttendan",nil];//@"www/model/CheckAttendan",@"www/model/CheckAttendan",nil];
        super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPLA",nil];//@"PLACE",@"PLACE",nil];
    }else{
        super.titles = [[NSArray alloc]initWithObjects:@"当日考勤",@"考勤查询",@"历史考勤统计",@"请假列表" ,nil];
        super.htmlNames = [[NSArray alloc]initWithObjects:@"attendanceDaily.html",@"attendanceQuery.html",@"accendanceHistoryStatistics.html",@"request_watch.html",nil];
        super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/CheckAttendan",@"www/model/CheckAttendan",@"www/model/CheckAttendan",@"www/model/CheckAttendan",nil];
        super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACECECE",@"PLACECECE",@"PLACECECE",@"PLACECECE",nil];
    }

    super.functionTitle = @"考勤信息";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    CheckAttendan* checkAttendan = [CheckAttendan new];
    [view addJavascriptInterfaces:checkAttendan WithName:@"CheckAttendan"];
    [super AddEasyJS:view];
}
@end
