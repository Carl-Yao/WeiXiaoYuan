//
//  FeedbackFromInTimeViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 15/1/29.
//  Copyright (c) 2015年 Dukeland. All rights reserved.
//

#import "FeedbackFromInTimeViewController.h"
#import "JsInterface.h"
#import "Feedback.h"
@interface FeedbackFromInTimeViewController ()

@end

@implementation FeedbackFromInTimeViewController
@synthesize arg;
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
    super.functionTitle = @"意见反馈";
    super.htmlDirectory = @"www/model/Feedback";
    super.htmlName = [NSString stringWithFormat:@"feedback-info-forInTime.html"];//;?%@",arg];
    JsInterface* interface = [JsInterface new];
    [self.viewcontroller addJavascriptInterfaces:interface WithName:@"JsInterface"];
    Feedback* feedback = [Feedback new];
    feedback.feedbackID = arg;
    [self.viewcontroller addJavascriptInterfaces:feedback WithName:@"Feedback"];
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
