//
//  InfoPublishViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/29.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "InfoPublishViewController.h"
#import "BackButton.h"
#import "JsInterface.h"
#import "AppButton.h"
#import "FestivalGreetingsViewController.h"
#import "NoticeViewController.h"
#import "UserManager.h"
#import "NoticeForParentViewController.h"
#import "FestivalGreetingsForParentViewController.h"
#import "BirthdayBlessingViewController.h"
#define WIDTH  75
#define HIGHT  100

#define TAGH  10

#define BTNWIDTH  WIDTH - TAGH
#define BTNHIGHT  HIGHT - TAGH
@interface InfoPublishViewController ()

@end

@implementation InfoPublishViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [returnButton setTitle:@"信息发布" forState:UIControlStateNormal];
    }
    return self;
}
- (void)CreateData
{
    if ([UserManager shareController].UserType == YEYTEACHER || [UserManager shareController].UserType == ZXXTEACHER)
    {
        m_arData = [[NSMutableArray alloc] initWithObjects:@"通知公告", @"节日祝福", @"生日祝福", nil];
        m_image = [[NSMutableArray alloc] initWithObjects:@"main_notice_announcement.png", @"second_festival_greetings.png", @"second_birthday_blessing", nil];
        
    }else{
        m_arData = [[NSMutableArray alloc] initWithObjects:@"通知公告", @"节日祝福", nil];//@"生日祝福", nil];
        m_image = [[NSMutableArray alloc] initWithObjects:@"main_notice_announcement.png", @"second_festival_greetings.png", nil];// @"second_birthday_blessing.png", nil];
    }
}

- (void)btnClicked:(id)sender event:(id)event
{
    UIButton *btn = (UIButton *)sender;
    if ([self->m_arData[btn.tag] isEqualToString:@"通知公告"])
    {
        if ([UserManager shareController].UserType == PARENT) {
            NoticeForParentViewController* view = [[NoticeForParentViewController alloc] init];
            //[self presentModalViewController:view animated:YES];
            [self presentViewController:view animated:YES completion:nil];
        }
        else
        {
           // NoticeViewController* view = [[NoticeViewController alloc] init];
//            //[self presentModalViewController:view animated:YES];
//            [self presentViewController:view animated:YES completion:nil];
        }
        
    }else if ([self->m_arData[btn.tag] isEqualToString:@"节日祝福"])
    {
        if ([UserManager shareController].UserType == PARENT) {
            FestivalGreetingsForParentViewController* view = [[FestivalGreetingsForParentViewController alloc] init];
            //[self presentModalViewController:view animated:YES];
            [self presentViewController:view animated:YES completion:nil];
        }
        else
        {
            FestivalGreetingsViewController* view = [[FestivalGreetingsViewController alloc] init];
            //[self presentModalViewController:view animated:YES];
            [self presentViewController:view animated:YES completion:nil];
        }
    }else if ([self->m_arData[btn.tag] isEqualToString:@"生日祝福"])
    {
        BirthdayBlessingViewController *view = [[BirthdayBlessingViewController alloc]init];
        [self presentViewController:view animated:YES completion:nil];
    }
}


- (void)backBtnClicked:(id)sender event:(id)event
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
