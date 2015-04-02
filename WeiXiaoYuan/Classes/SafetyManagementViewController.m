//
//  SafetyManagementViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 15/1/11.
//  Copyright (c) 2015年 Dukeland. All rights reserved.
//

#import "SafetyManagementViewController.h"
#import "VideoViewController.h"
#import "ChildPhoneViewController.h"

@interface SafetyManagementViewController ()

@end

@implementation SafetyManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [returnButton setTitle:@"安全管理" forState:UIControlStateNormal];
    }
    return self;
}
- (void)CreateData
{
    m_arData = [[NSMutableArray alloc] initWithObjects:@"校园视频",@"儿童手机", nil];
    
    m_image = [[NSMutableArray alloc] initWithObjects:@"second_school_video.png",@"second_child_phone.png", nil];
}

- (void)btnClicked:(id)sender event:(id)event
{
    UIButton *btn = (UIButton *)sender;
    if ([self->m_arData[btn.tag] isEqualToString:@"校园视频"])
    {
        VideoViewController* view = [[VideoViewController alloc] init];
        //[self presentModalViewController:view animated:YES];
        [self presentViewController:view animated:YES completion:nil];
    }else{
        ChildPhoneViewController* view = [[ChildPhoneViewController alloc] init];
        //[self presentModalViewController:view animated:YES];
        [self presentViewController:view animated:YES completion:nil];
    }
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
