//
//  ChildPhoneViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 15/1/11.
//  Copyright (c) 2015年 Dukeland. All rights reserved.
//

#import "ChildPhoneViewController.h"

@interface ChildPhoneViewController ()

@end

@implementation ChildPhoneViewController

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
    super.titles = [[NSArray alloc]initWithObjects:@"产品介绍",@"实时定位",@"历史轨迹",@"安全控制",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"phoneIntroduction.html",@"phoneRealTrack.html",@"phoneHistoryTrack.html",@"phoneSafeControl.html",nil];
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/ChildPhone",@"www/model/ChildPhone",@"www/model/ChildPhone",@"www/model/ChildPhone",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACE",@"PLACE",@"PLACE",@"PLACE",nil];
    super.functionTitle = @"儿童手机";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    //
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
