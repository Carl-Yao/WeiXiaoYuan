//
//  VideoViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 15/1/11.
//  Copyright (c) 2015年 Dukeland. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

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
    super.titles = [[NSArray alloc]initWithObjects:@"视频列表",@"实时视频",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"videoList2.html",@"video2.html",nil];
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/SafetyManagement",@"www/model/SafetyManagement",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACEPLACEPL",@"PLACEPLACEPL",nil];
    super.functionTitle = @"校园视频";
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
