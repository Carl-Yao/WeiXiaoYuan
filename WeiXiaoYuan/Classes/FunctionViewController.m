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
#import "SecondBaseViewControllerEx.h"
#import "SecondFunctionBaseViewControllerEx.h"
#import "JsInterface.h"
#import "SchoolSummary.h"
#import "CheckAttendan.h"
#import "BodyTemp.h"
#import "HomeWork.h"
#import "Feedback.h"
#import "StudentManagement.h"
#import "Notify.h"
#import "BirthdayBlessing.h"
#import "FestivalGreeting.h"
#import "GrowthTree.h"
#import "Health.h"
#import "Score.h"
#import "Teach.h"

#define WIDTH  75
#define HIGHT  100

#define TAGH  16

#define BTNWIDTH  WIDTH - TAGH
#define BTNHIGHT  HIGHT - TAGH

#define MODEL_CHILDREN_KEY     @"children"
#define MODEL_ID_KEY           @"modid"
#define MODEL_IMG_KEY          @"Img"
#define MODEL_TITLE_KEY        @"title"

#define FUNC_ID_KEY           @"funcid"
#define FUNC_IMG_KEY          @"Img"
#define FUNC_TITLE_KEY        @"title"
#define FUNC_HTML_KEY         @"html"
#define FUNC_DIRECTORY_KEY         @"directory"
#define FUNC_NAME_KEY         @"funcname"

@implementation FunctionViewController
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        allModelsDic = @{@"21":@{MODEL_IMG_KEY:@"main_school_homepage.png",
                                 MODEL_TITLE_KEY:@"学校主页"},
                         @"22":@{MODEL_IMG_KEY:@"main_attendance_info.png",
                                 MODEL_TITLE_KEY:@"考勤信息"},
                         @"23":@{MODEL_IMG_KEY:@"main_body_temperature.png",
                                 MODEL_TITLE_KEY:@"体温管理"},
                         @"24":@{MODEL_IMG_KEY:@"main_home_work.png",
                                 MODEL_TITLE_KEY:@"家庭作业"},
                         @"25":@{MODEL_IMG_KEY:@"main_info_publish.png",
                                 MODEL_TITLE_KEY:@"信息发布"},
                         @"27":@{MODEL_IMG_KEY:@"main_teach_mamagement.png",
                                 MODEL_TITLE_KEY:@"教学管理"},
                         @"28":@{MODEL_IMG_KEY:@"main_health_mamagement.png",
                                 MODEL_TITLE_KEY:@"健康管理"},
                         @"36":@{MODEL_IMG_KEY:@"main_advice_feedback.png",
                                 MODEL_TITLE_KEY:@"意见反馈"},
                         @"37":@{MODEL_IMG_KEY:@"leave_manager_info.png",
                                 MODEL_TITLE_KEY:@"请假管理"},
                         @"29":@{MODEL_IMG_KEY:@"main_familyschool_interaction.png",
                                 MODEL_TITLE_KEY:@"家校互动"},
                         @"100":@{MODEL_IMG_KEY:@"main_safety_management.png",
                                 MODEL_TITLE_KEY:@"安全管理"},
                         @"35":@{MODEL_IMG_KEY:@"main_education_information.png",
                                 MODEL_TITLE_KEY:@"教育资讯"},
                         @"26":@{MODEL_IMG_KEY:@"main_student_status_management.png",
                                 MODEL_TITLE_KEY:@"学籍管理"}};
        
        
        allFunctionsDic = @{@"2101":@{FUNC_IMG_KEY:@"main_notice_announcement.png",
                                      FUNC_TITLE_KEY:@"学校简介",
                                      FUNC_HTML_KEY:@"school.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/SchoolSummary"},
                            @"2102":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"师资力量",
                                      FUNC_HTML_KEY:@"teacher.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/SchoolSummary"},
                            @"2103":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"招生信息",
                                      FUNC_HTML_KEY:@"recruitstudentslist.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/SchoolSummary"},
                            @"2104":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"学校荣誉",
                                      FUNC_HTML_KEY:@"honer.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/SchoolSummary"},
                            @"2105":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"学校动态",
                                      FUNC_HTML_KEY:@"dynamiclist.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/SchoolSummary"},
                            @"2203":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"当日考勤",
                                      FUNC_HTML_KEY:@"attendanceTodayForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/CheckAttendan"},
                            @"2204":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"考勤查询",
                                      FUNC_HTML_KEY:@"attendanceQueryForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/CheckAttendan"},
                            @"2201":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"当日考勤",
                                      FUNC_HTML_KEY:@"attendanceDaily.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/CheckAttendan"},
                            @"2202":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"考勤查询",
                                      FUNC_HTML_KEY:@"attendanceQuery.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/CheckAttendan"},
                            @"2205":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"历史考勤统计",
                                      FUNC_HTML_KEY:@"accendanceHistoryStatistics.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/CheckAttendan"},
                            @"2206":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"请假列表",
                                      FUNC_HTML_KEY:@"request_watch.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/CheckAttendan"},
                            @"2207":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"教师当日考勤",
                                      FUNC_HTML_KEY:@"attendanceDaily_teacher.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/CheckAttendan"},
                            @"2303":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"体温记录",
                                      FUNC_HTML_KEY:@"bodyTempQueryForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/BodyTemp"},
                            @"2305":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"体温趋势",
                                      FUNC_HTML_KEY:@"tempTrendParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/BodyTemp"},
                            @"2301":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"体温告警",
                                      FUNC_HTML_KEY:@"bodyTempAlarm.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/BodyTemp"},
                            @"2302":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"体温记录",
                                      FUNC_HTML_KEY:@"bodyTempQuery.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/BodyTemp"},
                            @"2304":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"体温趋势",
                                      FUNC_HTML_KEY:@"tempTrend.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/BodyTemp"},
                            @"2403":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"当日作业",
                                      FUNC_HTML_KEY:@"homeworkTodayForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/HomeWork"},
                            @"2404":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"作业查询",
                                      FUNC_HTML_KEY:@"homeworkQueryForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/HomeWork"},
                            @"2401":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"作业发布",
                                      FUNC_HTML_KEY:@"homeworkPublish.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/HomeWork"},
                            @"2402":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"作业查询",
                                      FUNC_HTML_KEY:@"homeworkQuery.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/HomeWork"},
                            @"2502":@{FUNC_IMG_KEY:@"main_notice_announcement.png",
                                      FUNC_TITLE_KEY:@"通知列表",
                                      FUNC_HTML_KEY:@"notifyQuery.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Notify"},
                            @"2504":@{FUNC_IMG_KEY:@"second_festival_greetings.png",
                                      FUNC_TITLE_KEY:@"节日祝福查看",
                                      FUNC_HTML_KEY:@"greetingList.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/FestivalGreetings"},
                             //@"2503":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                               //       FUNC_TITLE_KEY:@"生日祝福",
                                 //     FUNC_HTML_KEY:@"",
                                   //   FUNC_DIRECTORY_KEY:@"www/model/FestivalGreetings"},
                            @"2501":@{FUNC_IMG_KEY:@"main_notice_announcement.png",
                                      FUNC_TITLE_KEY:@"发布通知",
                                      FUNC_HTML_KEY:@"notifyPublish.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Notify"},
                            @"2503":@{FUNC_IMG_KEY:@"second_festival_greetings.png",
                                      FUNC_TITLE_KEY:@"节日祝福发布",
                                      FUNC_HTML_KEY:@"greetingPublish.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/FestivalGreetings"},
                            @"2504":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"节日祝福查看",
                                      FUNC_HTML_KEY:@"greetingList.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/FestivalGreetings"},
                            @"2505":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"生日祝福提醒",
                                      FUNC_HTML_KEY:@"birthdayEarlyWarning.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/BirthdayBlessing"},
                            @"2506":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"生日祝福查看",
                                      FUNC_HTML_KEY:@"birthdayBlessingList.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/BirthdayBlessing"},
                            @"2601":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"在籍学生",
                                      FUNC_HTML_KEY:@"onDutyStudent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/StudentManagement"},
                            @"2602":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"学籍查询",
                                      FUNC_HTML_KEY:@"studentQuery.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/StudentManagement"},
                            @"2603":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"学籍统计",
                                      FUNC_HTML_KEY:@"StudentStatisticsQuery.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/StudentManagement"},
                            
                            @"2701":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"任课老师",
                                      FUNC_HTML_KEY:@"teacherList.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Teacher"},
                            @"2703":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"课程表",
                                      FUNC_HTML_KEY:@"courseList.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Teacher"},
                            @"2707":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"成绩分析",
                                      FUNC_HTML_KEY:@"scoreAnalysis.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Teacher"},
                            @"2702":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"任课老师",
                                      FUNC_HTML_KEY:@"teacherListForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Teacher"},
                            @"2704":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"课程表",
                                      FUNC_HTML_KEY:@"courseListForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Teacher"},
                            @"2705":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"成绩查询",
                                      FUNC_HTML_KEY:@"scoreQueryForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Teacher"},
                            @"2706":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"成绩分析",
                                      FUNC_HTML_KEY:@"scoreAnalysisForParent.html",
                                      FUNC_DIRECTORY_KEY:@"www/model/Teacher"},
                            
                            
                            @"2803":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"",
                                      FUNC_HTML_KEY:@"",
                                      FUNC_DIRECTORY_KEY:@"www/model/"},
                            @"2803":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"",
                                      FUNC_HTML_KEY:@"",
                                      FUNC_DIRECTORY_KEY:@"www/model/"},
                            @"2803":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"",
                                      FUNC_HTML_KEY:@"",
                                      FUNC_DIRECTORY_KEY:@"www/model/"},
                            @"2803":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"",
                                      FUNC_HTML_KEY:@"",
                                      FUNC_DIRECTORY_KEY:@"www/model/"},
                            @"2803":@{FUNC_IMG_KEY:@"main_student_status_management.png",
                                      FUNC_TITLE_KEY:@"",
                                      FUNC_HTML_KEY:@"",
                                      FUNC_DIRECTORY_KEY:@"www/model/"}
                            };
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
    laber.font = [UIFont boldSystemFontOfSize:20];
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
        appHeight = 80;
    }else{
        appHeight = 90;
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    int width = self.view.frame.size.width/3;
    for (int i = 0; i < [[UserManager shareController].modelArr count]; i++)
    {
        int t = i/3;
        int d = fmod(i, 3);
        UIView *nView = [[UIView alloc] initWithFrame:CGRectMake(width * d + 5, appHeight * t +0 + 64, WIDTH, appHeight)];
        CAppButton *appBtn = [CAppButton BtnWithType:UIButtonTypeCustom];
        [appBtn setFrame:CGRectMake(TAGH, TAGH, BTNWIDTH, appHeight - TAGH)];
        NSDictionary* item = [allModelsDic objectForKey:[(NSDictionary*)([UserManager shareController].modelArr[i]) objectForKey:MODEL_ID_KEY]];
        [appBtn setImage:[UIImage imageNamed:[item objectForKey:MODEL_IMG_KEY]]  forState:UIControlStateNormal];
        [appBtn setTitle:[item objectForKey:MODEL_TITLE_KEY] forState:UIControlStateNormal];
        [appBtn addTarget:self action:@selector(btnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
        appBtn.tag = i;
        [nView addSubview:appBtn];
        
        [self.view addSubview:nView];
        nView.userInteractionEnabled = YES;
    }
}

- (void)CreateData
{
//    if ([[UserManager shareController] UserType] == PARENT) {
//        m_arData = [[NSMutableArray alloc] initWithObjects:@"学校主页", @"考勤信息", @"体温管理", @"家庭作业", @"信息发布", @"教学管理", @"健康管理",@"意见反馈",@"请假管理", @"家校互动", @"安全管理", @"教育资讯", nil];
//        m_image = [[NSMutableArray alloc] initWithObjects:@"main_school_homepage.png", @"main_attendance_info.png", @"main_body_temperature.png", @"main_home_work.png", @"main_info_publish.png", @"main_teach_mamagement.png", @"main_health_mamagement.png",@"main_advice_feedback.png",@"leave_manager_info.png",@"main_familyschool_interaction.png", @"main_safety_management.png", @"main_education_information.png", nil];
//    }else{
//    m_arData = [[NSMutableArray alloc] initWithObjects:@"学校主页", @"考勤信息", @"体温管理", @"家庭作业", @"信息发布", @"学籍管理", @"教学管理", @"健康管理",@"意见反馈", @"家校互动", @"安全管理", @"教育资讯", nil];
//    m_image = [[NSMutableArray alloc] initWithObjects:@"main_school_homepage.png", @"main_attendance_info.png", @"main_body_temperature.png", @"main_home_work.png", @"main_info_publish.png", @"main_student_status_management.png", @"main_teach_mamagement.png", @"main_health_mamagement.png",@"main_advice_feedback.png", @"main_familyschool_interaction.png", @"main_safety_management.png", @"main_education_information.png", nil];
//    }
}

- (void)btnClicked:(id)sender event:(id)event
{
    UIButton *btn = (UIButton *)sender;
    NSDictionary* item = [UserManager shareController].modelArr[btn.tag];
    NSDictionary* modelItem = [allModelsDic objectForKey:[item objectForKey:MODEL_ID_KEY]];
    NSArray* funcList = [item objectForKey:MODEL_CHILDREN_KEY];
    
    SecondBaseViewControllerEx *secondVC = [[SecondBaseViewControllerEx alloc] init];
    secondVC.m_arData = [[NSMutableArray alloc]init];
    secondVC.m_image = [[NSMutableArray alloc]init];
    secondVC.htmlNames = [[NSMutableArray alloc]init];
    secondVC.htmlDirectorys = [[NSMutableArray alloc]init];
    for (int i = 0; i < [funcList count];i++) {
        [secondVC.m_arData addObject:[funcList[i] objectForKey:FUNC_NAME_KEY]];
        NSDictionary* dic = [allFunctionsDic objectForKey:[funcList[i] objectForKey:FUNC_ID_KEY]];
        [secondVC.m_image addObject:[dic objectForKey:FUNC_IMG_KEY]];
        [secondVC.htmlNames addObject:[dic objectForKey:FUNC_HTML_KEY]];
        [secondVC.htmlDirectorys addObject:[dic objectForKey:FUNC_DIRECTORY_KEY]];
    }
    [secondVC.returnButton setTitle:[modelItem objectForKey:MODEL_TITLE_KEY] forState:UIControlStateNormal];
    __weak SecondBaseViewControllerEx* weadSelf = secondVC;
    secondVC.btnClickedBlock = ^(NSInteger index){
        SecondFunctionBaseViewControllerEx* secondFunVC = [[SecondFunctionBaseViewControllerEx alloc] init];
        secondFunVC.htmlName = weadSelf.htmlNames[index];
        secondFunVC.htmlDirectory = weadSelf.htmlDirectorys[index];
        secondFunVC.functionTitle = weadSelf.m_arData[index];
        
        JsInterface* interface = [JsInterface new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:interface WithName:@"JsInterface"];
        [secondFunVC.viewcontroller addJavascriptInterfaces:interface WithName:@"TelInterface"];
        
        SchoolSummary* schoolSummary = [SchoolSummary new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:schoolSummary WithName:@"SchoolSummary"];
        
        CheckAttendan* checkAttendan = [CheckAttendan new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:checkAttendan WithName:@"CheckAttendan"];
        
        StudentManagement* studentManagement = [StudentManagement new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:studentManagement WithName:@"StudentManagement"];
        
        Feedback* feedback = [Feedback new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:feedback WithName:@"Feedback"];
        
        BodyTemp* bodyTemp = [BodyTemp new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:bodyTemp WithName:@"BodyTemp"];
        
        Notify* notify = [Notify new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:notify WithName:@"Notify"];
        
        BirthdayBlessing* birthdayBlessing = [BirthdayBlessing new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:birthdayBlessing WithName:@"BirthdayBlessing"];
        
        FestivalGreeting* festivalGreeting = [FestivalGreeting new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:festivalGreeting WithName:@"FestivalGreeting"];
        
        GrowthTree* grow = [GrowthTree new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:grow WithName:@"GrowthTree"];
        
        Health* health = [Health new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:health WithName:@"Health"];
        
        Score* score = [Score new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:score WithName:@"Score"];
        
        HomeWork* homeWork = [HomeWork new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:homeWork WithName:@"HomeWork"];
        
        Teach* teach = [Teach new];
        [secondFunVC.viewcontroller addJavascriptInterfaces:teach WithName:@"Teach"];
        
        [secondFunVC InitFunctionView];
        
        //SchoolHomeViewController* vc = [[SchoolHomeViewController alloc] init];
        //[weadSelf presentModalViewController:vc animated:YES];
        [weadSelf presentModalViewController:secondFunVC animated:YES];
    };
    
    [secondVC InitWithData];
    //SchoolHomeViewController* vc = [[SchoolHomeViewController alloc] init];
    //[self presentModalViewController:vc animated:YES];
    [self presentModalViewController:secondVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}@end
