
//
//  EduNewsViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 15/1/11.
//  Copyright (c) 2015年 Dukeland. All rights reserved.
//

#import "EduNewsViewController.h"

@interface EduNewsViewController ()

@end

@implementation EduNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)InitFunctionView
{
    super.functionTitle = @"教育资讯";
    super.htmlDirectory = @"www/model/EduNews";
    super.htmlName = @"newslist.html";
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
