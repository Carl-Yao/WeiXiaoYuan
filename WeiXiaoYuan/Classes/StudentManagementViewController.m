//
//  StudentManagementViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/13.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "StudentManagementViewController.h"
#import "JsInterface.h"
#import "StudentManagement.h"
@interface StudentManagementViewController ()

@end

@implementation StudentManagementViewController
- (void)InitFunctionView
{
    //son class
    super.titles = [[NSArray alloc]initWithObjects:@"在籍学生",@"学籍查询",@"学籍统计",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"onDutyStudent.html",@"studentQuery.html",@"StudentStatisticsQuery.html",nil];
    
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/StudentManagement",@"www/model/StudentManagement",@"www/model/StudentManagement",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACECE",@"PLACECE",@"PLACECE",nil];
    super.functionTitle = @"学籍管理";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    StudentManagement* studentManagement = [StudentManagement new];
    [view addJavascriptInterfaces:studentManagement WithName:@"StudentManagement"];
    [view addJavascriptInterfaces:interface WithName:@"TelInterface"];
    [super AddEasyJS:view];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
