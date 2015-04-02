//
//  GrowthTreesViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "GrowthTreesViewController.h"
#import "JsInterface.h"
#import "UserManager.h"
#import "GrowthTree.h"
@interface GrowthTreesViewController ()

@end

@implementation GrowthTreesViewController
-(void)InitFunctionView
{
    super.functionTitle = @"成长树";
    super.htmlDirectory = @"www/model/GrowthTree";
    super.htmlName = @"growthTree.html";
    JsInterface* interface = [JsInterface new];
    [self.viewcontroller addJavascriptInterfaces:interface WithName:@"JsInterface"];
    GrowthTree* grow = [GrowthTree new];
    [self.viewcontroller addJavascriptInterfaces:grow WithName:@"GrowthTree"];
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
