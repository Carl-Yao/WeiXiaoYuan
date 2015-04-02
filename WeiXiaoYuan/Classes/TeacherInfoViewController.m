//
//  TeacherInfoViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "TeacherInfoViewController.h"
#import "UserManager.h"
#import "JsInterface.h"
#import "Teach.h"
@interface TeacherInfoViewController ()

@end

@implementation TeacherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)InitFunctionView
{
    //son class
    super.titles = [[NSArray alloc]initWithObjects:@"任课老师",@"课程表",nil];
    
    if ([[UserManager shareController] UserType] == PARENT) {
        super.htmlNames = [[NSArray alloc]initWithObjects:@"teacherListForParent.html",@"courseListForParent.html",nil];
    }
    else{
        super.htmlNames = [[NSArray alloc]initWithObjects:@"teacherList.html",@"courseList.html",nil];
    }
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/Teacher",@"www/model/Course",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPL",nil];
    super.functionTitle = @"教学信息";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    Teach* teach = [Teach new];
    [view addJavascriptInterfaces:teach WithName:@"Teach"];
    //添加TelInterface
    //TelInterface* telInterface = [telInterface new];
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
