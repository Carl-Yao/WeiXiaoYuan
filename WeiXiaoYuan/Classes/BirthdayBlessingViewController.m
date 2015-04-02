//
//  BirthdayBlessingViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/19.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "BirthdayBlessingViewController.h"
#import "JsInterface.h"
#import "BirthdayBlessing.h"
@interface BirthdayBlessingViewController ()

@end

@implementation BirthdayBlessingViewController
- (void)InitFunctionView
{
    //son class
    super.titles = [[NSArray alloc]initWithObjects:@"生日祝福提醒",@"生日祝福查看",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"birthdayEarlyWarning.html",@"birthdayBlessingList.html",nil];
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/BirthdayBlessing",@"www/model/BirthdayBlessing",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPL",nil];
    super.functionTitle = @"生日祝福";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    BirthdayBlessing* birthdayBlessing = [BirthdayBlessing new];
    [view addJavascriptInterfaces:birthdayBlessing WithName:@"BirthdayBlessing"];
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
