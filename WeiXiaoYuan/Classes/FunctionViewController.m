//
//  FunctionViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14-10-10.
//
//

#import "FunctionViewController.h"
#import "AppButton.h"
#import "SchoolHomeViewController.h"
#import "AttendanceInfoViewController.h"
#import "BodyTemperatureViewController.h"
#import "HomeWorkViewController.h"
#import "InfoPublishViewController.h"
#import "StudentManagementViewController.h"
#import "UserManager.h"
#import "TeacherManagementViewController.h"
#import "HealthMamagementViewController.h"
#import "LeaveManagementViewController.h"
#import "FeedbackViewController.h"
#import "FeedbackNoParentViewController.h"
#import "NoticeForParentViewController.h"
#import "NoticeViewController.h"
#import "EduNewsViewController.h"
#import "SafetyManagementViewController.h"
#import "AppDelegate.h"
#define WIDTH  75
#define HIGHT  100

#define TAGH  10

#define BTNWIDTH  WIDTH - TAGH
#define BTNHIGHT  HIGHT - TAGH
@implementation FunctionViewController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self CreateData];
    
    // Set Stationary Background, so that while the user scroll the background is
    // fixed.
//    UIImage *bj = [UIImage imageNamed:@"bj.jpg"];
//    UIImageView *bjview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64-1, self.view.frame.size.width, self.view.frame.size.height - 64-49+1)];
//    bjview.image = bj;
//    [self.view insertSubview:bjview atIndex:0];
    [self.view setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0]];
    
    UIImage *image = [UIImage imageNamed:@"top_bj.9.jpg"];
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, self.view.frame.size.width+4, 64+2)];
    
    view.image = image;
    [self.view insertSubview:view atIndex:0];
    
    //UIImage *image1 = [UIImage imageNamed:@"logo.png"];
    UIImageView *view1 = [[UIImageView alloc]initWithFrame:CGRectMake(8, 22, 38, 38)];
    view1.image = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).logoImg;
    [self.view insertSubview:view1 atIndex:1];
    
    UILabel *laber = [[UILabel alloc]initWithFrame:CGRectMake(78, 20, self.view.frame.size.width - 68 , 64)];
    
    laber.text = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).schoolName;
    laber.textColor = [UIColor whiteColor];
    laber.font = [UIFont boldSystemFontOfSize:24];
    laber.lineBreakMode = UILineBreakModeCharacterWrap;
    laber.textAlignment = UITextAlignmentLeft;
    [self.view insertSubview:laber atIndex:1];
    
    [laber sizeToFit];
    
    laber.center = CGPointMake((self.view.frame.size.width - 68)/2+34,64/2+10);
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat height = size.height;
    int appHeight = 0;
    if (height == 480)
    {
        appHeight = 90;
    }else{
        appHeight = 100;
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    int width = self.view.frame.size.width/3;
    for (int i = 0; i < [m_arData count]; i++)
    {
        int t = i/3;
        int d = fmod(i, 3);
        UIView *nView = [[UIView alloc] initWithFrame:CGRectMake(width * d + 5, appHeight * t +0 + 64, WIDTH, appHeight)];
        CAppButton *appBtn = [CAppButton BtnWithType:UIButtonTypeCustom];
        [appBtn setFrame:CGRectMake(TAGH, TAGH, BTNWIDTH, appHeight - TAGH)];
        [appBtn setImage:[UIImage imageNamed:[m_image objectAtIndex:i]] forState:UIControlStateNormal];
        [appBtn setTitle:[m_arData objectAtIndex:i] forState:UIControlStateNormal];
        [appBtn addTarget:self action:@selector(btnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
        appBtn.tag = i;
        [nView addSubview:appBtn];
        
        [self.view addSubview:nView];
        nView.userInteractionEnabled = YES;
    }

//    //
//    UIImageView *imageItem1 = [[UIImageView alloc]initWithFrame:CGRectMake(-2+10,64+10, 40,40)];
//    imageItem1.image = image1;
//    [self.view insertSubview:imageItem1 atIndex:1];
//    UIImageView *imageItem2 = [[UIImageView alloc]initWithFrame:CGRectMake(-2+10+40+10,64+10, 40,40)];
//    imageItem2.image = image1;
//    [self.view insertSubview:imageItem2 atIndex:1];
//    UIImageView *imageItem3 = [[UIImageView alloc]initWithFrame:CGRectMake(64+10, -2+10, 40,40)];
//    UIImageView *imageItem4 = [[UIImageView alloc]initWithFrame:CGRectMake(64+10, -2+10, 40,40)];
	// Do any additional setup after loading the view.
}

- (void)CreateData
{
    if ([[UserManager shareController] UserType] == PARENT) {
        m_arData = [[NSMutableArray alloc] initWithObjects:@"学校主页", @"考勤信息", @"体温管理", @"家庭作业", @"信息发布", @"教学管理", @"健康管理",@"意见反馈",@"请假管理", @"家校互动", @"安全管理", @"教育资讯", nil];
        m_image = [[NSMutableArray alloc] initWithObjects:@"main_school_homepage.png", @"main_attendance_info.png", @"main_body_temperature.png", @"main_home_work.png", @"main_info_publish.png", @"main_teach_mamagement.png", @"main_health_mamagement.png",@"main_advice_feedback.png",@"leave_manager_info.png",@"main_familyschool_interaction.png", @"main_safety_management.png", @"main_education_information.png", nil];
    }else{
    m_arData = [[NSMutableArray alloc] initWithObjects:@"学校主页", @"考勤信息", @"体温管理", @"家庭作业", @"信息发布", @"学籍管理", @"教学管理", @"健康管理",@"意见反馈", @"家校互动", @"安全管理", @"教育资讯", nil];
    m_image = [[NSMutableArray alloc] initWithObjects:@"main_school_homepage.png", @"main_attendance_info.png", @"main_body_temperature.png", @"main_home_work.png", @"main_info_publish.png", @"main_student_status_management.png", @"main_teach_mamagement.png", @"main_health_mamagement.png",@"main_advice_feedback.png", @"main_familyschool_interaction.png", @"main_safety_management.png", @"main_education_information.png", nil];
    }
}

- (void)btnClicked:(id)sender event:(id)event
{
    UIButton *btn = (UIButton *)sender;
    if ([self->m_arData[btn.tag] isEqualToString:@"学校主页"])
    {
        SchoolHomeViewController *schoolHomeView = [[SchoolHomeViewController alloc] init];
        [self presentModalViewController:schoolHomeView animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"考勤信息"])
    {
        AttendanceInfoViewController *attendanceInfoView = [[AttendanceInfoViewController alloc] init];
        [self presentModalViewController:attendanceInfoView animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"体温管理"])
    {
        BodyTemperatureViewController *bodyTemperatureView = [[BodyTemperatureViewController alloc] init];
        [self presentModalViewController:bodyTemperatureView animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"家庭作业"])
    {
        HomeWorkViewController *view = [[HomeWorkViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"信息发布"])
    {
        InfoPublishViewController *view = [[InfoPublishViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"学籍管理"])
    {
        StudentManagementViewController *view = [[StudentManagementViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"教学管理"])
    {
        TeacherManagementViewController *view = [[TeacherManagementViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"健康管理"])
    {
        HealthMamagementViewController *view = [[HealthMamagementViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"意见反馈"])
    {
        if ([[UserManager shareController] UserType] == PARENT) {
            FeedbackViewController *view = [[FeedbackViewController alloc] init];
            [self presentModalViewController:view animated:YES];
        }else{
            FeedbackNoParentViewController *view = [[FeedbackNoParentViewController alloc] init];
            [self presentModalViewController:view animated:YES];
        }
    }else if ([self->m_arData[btn.tag] isEqualToString:@"请假管理"])
    {
        LeaveManagementViewController *view = [[LeaveManagementViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"家校互动"])
    {
        if ([UserManager shareController].UserType == PARENT) {
            NoticeForParentViewController* view = [[NoticeForParentViewController alloc] init];
            //[self presentModalViewController:view animated:YES];
            [self presentViewController:view animated:YES completion:nil];
        }
        else
        {
            NoticeViewController* view = [[NoticeViewController alloc] init];
            //[self presentModalViewController:view animated:YES];
            [self presentViewController:view animated:YES completion:nil];
        }
    }else if ([self->m_arData[btn.tag] isEqualToString:@"教育资讯"])
    {
        EduNewsViewController *view = [[EduNewsViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }else if ([self->m_arData[btn.tag] isEqualToString:@"安全管理"])
    {
        SafetyManagementViewController *view = [[SafetyManagementViewController alloc] init];
        [self presentModalViewController:view animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}@end
