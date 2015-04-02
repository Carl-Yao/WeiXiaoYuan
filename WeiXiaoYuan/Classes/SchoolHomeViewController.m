//
//  SchoolHomeViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/11/16.
//
//

#import "SchoolHomeViewController.h"
#import "DKScrollingTabController.h"
#import "BackButton.h"
#import "JsInterface.h"
#import "SchoolSummary.h"
@interface SchoolHomeViewController ()

@end

@implementation SchoolHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)InitFunctionView
{
    //son class
    super.titles = [[NSArray alloc]initWithObjects:@"学校简介",@"师资力量",@"招生信息",@"学校荣誉",@"学校动态",nil];
    super.htmlNames = [[NSArray alloc]initWithObjects:@"school.html",@"teacher.html",@"recruitstudentslist.html",@"honer.html",@"dynamiclist.html",nil];
    super.htmlDirectorys = [[NSArray alloc]initWithObjects:@"www/model/SchoolSummary",@"www/model/SchoolSummary",@"www/model/SchoolSummary",@"www/model/SchoolSummary",@"www/model/SchoolSummary",nil];
    super.spaceSizes = [[NSArray alloc]initWithObjects:@"PLACE",@"PLACE",@"PLACE",@"PLACE",@"PLACE",nil];
    super.functionTitle = @"学校主页";
    [super InitFunctionView];
    
}
- (void)AddEasyJS:(EasyJSWebView*)view
{
    JsInterface* interface = [JsInterface new];
    [view addJavascriptInterfaces:interface WithName:@"JsInterface"];
    SchoolSummary* schoolSummary = [SchoolSummary new];
    [view addJavascriptInterfaces:schoolSummary WithName:@"SchoolSummary"];
    [super AddEasyJS:view];
}
@end
