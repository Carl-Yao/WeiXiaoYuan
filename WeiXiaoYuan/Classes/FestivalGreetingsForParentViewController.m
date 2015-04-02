//
//  FestivalGreetingsForParentViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/19.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "FestivalGreetingsForParentViewController.h"
#import "JsInterface.h"
#import "FestivalGreeting.h"
@interface FestivalGreetingsForParentViewController ()

@end

@implementation FestivalGreetingsForParentViewController
-(void)InitFunctionView
{
    super.functionTitle = @"节日祝福";
    super.htmlDirectory = @"www/model/FestivalGreetings";
    super.htmlName = @"greetingList.html";
    JsInterface* interface = [JsInterface new];
    [self.viewcontroller addJavascriptInterfaces:interface WithName:@"JsInterface"];
    FestivalGreeting* festivalGreeting = [FestivalGreeting new];
    [self.viewcontroller addJavascriptInterfaces:festivalGreeting WithName:@"FestivalGreeting"];
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
