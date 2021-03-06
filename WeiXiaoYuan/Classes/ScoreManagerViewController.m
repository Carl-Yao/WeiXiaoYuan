//
//  ScoreManagerViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "ScoreManagerViewController.h"
#import "UserManager.h"
#import "JsInterface.h"
#import "Score.h"
@interface ScoreManagerViewController ()

@end

@implementation ScoreManagerViewController

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
    super.titles = [[NSArray alloc]initWithObjects:@"成绩查询",@"成绩分析",nil];
    
    if ([[UserManager shareController] UserType] == PARENT) {
        super.htmlNames = [[NSArray alloc]initWithObjects:@"scoreQueryForParent.html",@"scoreAnalysisForParent.html",nil];
    }
    else{
        super.htmlNames = [[NSArray alloc]initWithObjects:@"scoreQuery.html",@"scoreAnalysis.html",nil];
    }
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/Score",@"www/model/Score",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPL",nil];
    super.functionTitle = @"成绩管理";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    Score* score = [Score new];
    [view addJavascriptInterfaces:score WithName:@"Score"];
    
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
