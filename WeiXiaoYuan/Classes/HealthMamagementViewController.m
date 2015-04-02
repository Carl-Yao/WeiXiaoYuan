//
//  HealthMamagementViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "HealthMamagementViewController.h"
#import "UserManager.h"
#import "HealthViewController.h"
#import "GrowthTreesViewController.h"
@interface HealthMamagementViewController ()

@end

@implementation HealthMamagementViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [returnButton setTitle:@"健康管理" forState:UIControlStateNormal];
    }
    return self;
}
- (void)CreateData
{
    if ([[UserManager shareController] UserType] == PARENT) {
        m_arData = [[NSMutableArray alloc] initWithObjects:@"体检管理",@"成长树", nil];
        m_image = [[NSMutableArray alloc] initWithObjects:@"second_bodycheck_management.png",@"main_grow_tree.png", nil];
    }else{
        m_arData = [[NSMutableArray alloc] initWithObjects:@"体检管理", nil];
        m_image = [[NSMutableArray alloc] initWithObjects:@"second_teach_info.png", nil];
    }
}

- (void)btnClicked:(id)sender event:(id)event
{
    UIButton *btn = (UIButton *)sender;
    if ([self->m_arData[btn.tag] isEqualToString:@"体检管理"])
    {
        HealthViewController* view = [[HealthViewController alloc] init];
        //[self presentModalViewController:view animated:YES];
        [self presentViewController:view animated:YES completion:nil];
    }else{
        GrowthTreesViewController* view = [[GrowthTreesViewController alloc] init];
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
