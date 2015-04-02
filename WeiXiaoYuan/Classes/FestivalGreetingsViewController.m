//
//  FestivalGreetingsViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "FestivalGreetingsViewController.h"
#import "BackButton.h"
#import "JsInterface.h"
#import "FestivalGreeting.h"
@interface FestivalGreetingsViewController ()

@end

@implementation FestivalGreetingsViewController
- (void)InitFunctionView
{
    //son class
    super.titles = [[NSArray alloc]initWithObjects:@"祝福发布",@"祝福查看",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"greetingPublish.html",@"greetingList.html",nil];
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/FestivalGreetings",@"www/model/FestivalGreetings",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPL",nil];
    super.functionTitle = @"节日祝福";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    FestivalGreeting* festivalGreeting = [FestivalGreeting new];
    [view addJavascriptInterfaces:festivalGreeting WithName:@"FestivalGreeting"];
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
