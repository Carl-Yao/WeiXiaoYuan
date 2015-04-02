//
//  FeedbackViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/22.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "FeedbackViewController.h"
#import "JsInterface.h"
#import "Feedback.h"
@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

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
    super.titles = [[NSArray alloc]initWithObjects:@"意见反馈",@"反馈列表",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"feedback-add.html",@"feedback-list.html",nil];
    
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/Feedback",@"www/model/Feedback",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPLA",nil];
    super.functionTitle = @"意见反馈";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    Feedback* feedback = [Feedback new];
    [view addJavascriptInterfaces:feedback WithName:@"Feedback"];
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
