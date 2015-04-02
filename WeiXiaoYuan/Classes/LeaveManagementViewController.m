
//
//  LeaveManagementViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/21.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "LeaveManagementViewController.h"
#import "JsInterface.h"
#import "CheckAttendan.h"
@interface LeaveManagementViewController ()

@end

@implementation LeaveManagementViewController
- (void)InitFunctionView
{
    //son class
    super.titles = [[NSArray alloc]initWithObjects:@"请假申请",@"请假查看",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"parent_request.html",@"parent_watch.html",nil];
    
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/CheckAttendan",@"www/model/CheckAttendan",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPLA",nil];
    super.functionTitle = @"请假管理";
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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
