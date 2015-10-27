////
////  BodyTemperatureViewController.m
////  WeiXiaoYuan
////
////  Created by 姚振兴 on 14/11/29.
////  Copyright (c) 2014年 Dukeland. All rights reserved.
////
//
//#import "BodyTemperatureViewController.h"
//#import "DKScrollingTabController.h"
//#import "BackButton.h"
//#import "JsInterface.h"
//#import "UserManager.h"
//#import "BodyTemp.h"
//@interface BodyTemperatureViewController ()
//
//@end
//
//@implementation BodyTemperatureViewController
//- (void)InitFunctionView
//{
//    //son class
//    
//    if ([UserManager shareController].UserType == PARENT)
//    {
//        super.titles = [[NSArray alloc]initWithObjects:@"体温记录",@"体温趋势",nil];
//        super.htmlNames = [[NSArray alloc]initWithObjects:@"bodyTempQueryForParent.html",@"tempTrendParent.html",nil];
//        super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/BodyTemp",@"www/model/BodyTemp",nil];
//        super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPLA",nil];
//
//    }else{
//        super.titles = [[NSArray alloc]initWithObjects:@"体温告警",@"体温记录",@"体温趋势",nil];
//        super.htmlNames = [[NSArray alloc]initWithObjects:@"bodyTempAlarm.html",@"bodyTempQuery.html",@"tempTrend.html",nil];
//        super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/BodyTemp",@"www/model/BodyTemp",@"www/model/BodyTemp",nil];
//        super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACECE",@"PLACECE",@"PLACECE",nil];
//
//    }
//    
//    super.functionTitle = @"体温管理";
//    [super InitFunctionView];
//    
//}
//- (void)AddEasyJS:(EasyJSWebView*)view
//{
//    JsInterface* interface = [JsInterface new];
//    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
//    BodyTemp* bodyTemp = [BodyTemp new];
//    [view addJavascriptInterfaces:bodyTemp WithName:@"BodyTemp"];
//    [super AddEasyJS:view];
//}
//@end
