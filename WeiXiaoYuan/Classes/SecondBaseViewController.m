//
//  SecondBaseViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/18.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "SecondBaseViewController.h"
#import "AppButton.h"
#import "AppDelegate.h"
#define WIDTH  75
#define HIGHT  100

#define TAGH  16

#define BTNWIDTH  WIDTH - TAGH
#define BTNHIGHT  HIGHT - TAGH

@interface SecondBaseViewController ()

@end

@implementation SecondBaseViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"InfoPublish";
        [self CreateData];
        UIImageView* allBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50)];
        [allBg setImage:[UIImage imageNamed:@"新版APP_02"]];
        [self.view insertSubview:allBg atIndex:0];
        self.view.backgroundColor = [UIColor whiteColor];
        UIImage *image = [UIImage imageNamed:@"top_bj.91.png"];
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, self.view.frame.size.width+4, 64+2)];
        view.image = image;
        [self.view addSubview:view];
        
        //UIImage *image1 = [UIImage imageNamed:@"logo.png"];
        UIImageView *view1 = [[UIImageView alloc]initWithFrame:CGRectMake(8, 22, 38, 38)];
        view1.image = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).logoImg;
        [self.view addSubview:view1];
        
        UIImage *imagetitle = [UIImage imageNamed:@"bg_titleyzx.png"];
        UIImageView *viewtitle = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 64, self.view.frame.size.width+20, 44)];
        viewtitle.image = imagetitle;
        [self.view addSubview:viewtitle];
        //
        returnButton = [[BackButton alloc] initWithFrame:CGRectMake(2, 64+3, 150, 38)];
        //[returnButton setTitle:@"信息发布" forState:UIControlStateNormal];
        [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        returnButton.titleLabel.textColor = [UIColor blackColor];
        
        returnButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        //换返回按钮图标和文字
        UIImage *imageback = [UIImage imageNamed:@"title_back.png"];
        [returnButton setImage:imageback forState:UIControlStateNormal];
        returnButton.imageView.frame = CGRectMake(returnButton.imageView.frame.origin.x, returnButton.imageView.frame.origin.y-12, (returnButton.imageView.frame.size.width)/2, (returnButton.imageView.frame.size.height-24)/2);
        [self.view insertSubview:returnButton atIndex:2];
        returnButton.titleLabel.textColor = [UIColor blackColor];
        [returnButton addTarget:self action:@selector(backBtnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *laber = [[UILabel alloc]initWithFrame:CGRectMake(78, 20, self.view.frame.size.width - 68 , 64)];
        
        laber.text = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).schoolName;
        laber.textColor = [UIColor blackColor];
        laber.font = [UIFont boldSystemFontOfSize:24];
        laber.lineBreakMode = UILineBreakModeCharacterWrap;
        laber.textAlignment = UITextAlignmentLeft;
        [self.view insertSubview:laber atIndex:2];
        [laber sizeToFit];
        laber.center = CGPointMake((self.view.frame.size.width - 68)/2+34,64/2+10);
        
        //set app button background update_bg.jpg
//        UIImage *appButtonImagetitle = [UIImage imageNamed:@"update_bg.jpg"];
//        UIImageView *appButtonView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64 + 44, self.view.frame.size.width, self.view.frame.size.height - 64 - 44)];
//        appButtonView.image = appButtonImagetitle;
//        [self.view insertSubview:appButtonView atIndex:0];
        [self.view setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0]];
        
        [self CreateData];
        // Do any additional setup after loading the view, typically from a nib.
        int width = self.view.frame.size.width/3;
        for (int i = 0; i < [m_arData count]; i++)
        {
            int t = i/3;
            int d = fmod(i, 3);
            UIView *nView = [[UIView alloc] initWithFrame:CGRectMake(width * d + 5, HIGHT * t +0 + 64 + 44, WIDTH, HIGHT)];
            CAppButton *appBtn = [CAppButton BtnWithType:UIButtonTypeCustom];
            [appBtn setFrame:CGRectMake(TAGH, TAGH, BTNWIDTH, BTNHIGHT)];
            [appBtn setImage:[UIImage imageNamed:[m_image objectAtIndex:i]] forState:UIControlStateNormal];
            [appBtn setTitle:[m_arData objectAtIndex:i] forState:UIControlStateNormal];
            [appBtn addTarget:self action:@selector(btnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
            appBtn.tag = i;
            [nView addSubview:appBtn];
            
            [self.view insertSubview:nView atIndex:1];
            nView.userInteractionEnabled = YES;
        }
    }
    return self;
}
- (void)CreateData
{
//    m_arData = [[NSMutableArray alloc] initWithObjects:@"通知公告", @"节日祝福", nil];//@"生日祝福", nil];
//    m_image = [[NSMutableArray alloc] initWithObjects:@"main_notice_announcement.png", @"second_festival_greetings.png", nil];// @"second_birthday_blessing.png", nil];
}

- (void)btnClicked:(id)sender event:(id)event
{
//    UIButton *btn = (UIButton *)sender;
//    if ([self->m_arData[btn.tag] isEqualToString:@"通知公告"])
//    {
//        NoticeViewController* view = [[NoticeViewController alloc] init];
//        //[self presentModalViewController:view animated:YES];
//        [self presentViewController:view animated:YES completion:nil];
//    }else if ([self->m_arData[btn.tag] isEqualToString:@"节日祝福"])
//    {
//        FestivalGreetingsViewController* view = [[FestivalGreetingsViewController alloc] init];
//        [self presentViewController:view animated:YES completion:nil];
//    }
}


- (void)backBtnClicked:(id)sender event:(id)event
{
    [self dismissModalViewControllerAnimated:YES];
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
