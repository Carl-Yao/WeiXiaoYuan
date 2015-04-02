//
//  TeacherManagementViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "TeacherManagementViewController.h"
#import "TeacherInfoViewController.h"
#import "UserManager.h"
#import "ScoreManagerViewController.h"
@interface TeacherManagementViewController ()

@end

@implementation TeacherManagementViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [returnButton setTitle:@"教学管理" forState:UIControlStateNormal];
    }
    return self;
}
- (void)CreateData
{
    if ([[UserManager shareController] UserType] == YEYPRESIDENT || [[UserManager shareController] UserType] == YEYTEACHER) {
        m_arData = [[NSMutableArray alloc] initWithObjects:@"教学信息", nil];
        m_image = [[NSMutableArray alloc] initWithObjects:@"second_teach_info.png", nil];
    }else{
        m_arData = [[NSMutableArray alloc] initWithObjects:@"教学信息",@"成绩管理", nil];
        m_image = [[NSMutableArray alloc] initWithObjects:@"second_teach_info.png",@"main_score_management.png", nil];
    }
}

- (void)btnClicked:(id)sender event:(id)event
{
    UIButton *btn = (UIButton *)sender;
    if ([self->m_arData[btn.tag] isEqualToString:@"教学信息"])
    {
        TeacherInfoViewController* view = [[TeacherInfoViewController alloc] init];
            //[self presentModalViewController:view animated:YES];
        [self presentViewController:view animated:YES completion:nil];
    }else{
        ScoreManagerViewController* view = [[ScoreManagerViewController alloc] init];
        //[self presentModalViewController:view animated:YES];
        [self presentViewController:view animated:YES completion:nil];
    }
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
