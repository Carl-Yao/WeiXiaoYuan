//
//  HealthViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "HealthViewController.h"
#import "UserManager.h"
#import "JsInterface.h"
#import "Health.h"
@interface HealthViewController ()

@end

@implementation HealthViewController
- (void)InitFunctionView
{
    //son class
    super.titles = [[NSArray alloc]initWithObjects:@"体检记录",@"体检分析",nil];
    
    if ([[UserManager shareController] UserType] == PARENT) {
        super.htmlNames = [[NSArray alloc]initWithObjects:@"physicalExamRecordForParent.html",@"physicalExamAnalysisForParent.html",nil];
    }
    else{
        super.htmlNames = [[NSArray alloc]initWithObjects:@"physicalExamRecord.html",@"physicalExamAnalysis.html",nil];
    }
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/Health",@"www/model/Health",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPLs",@"PLACEPLACEPLs",nil];
    super.functionTitle = @"体检管理";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    Health* health = [Health new];
    [view addJavascriptInterfaces:health WithName:@"Health"];
    
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
