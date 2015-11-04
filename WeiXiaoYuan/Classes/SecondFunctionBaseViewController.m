//
//  SecondFunctionBaseViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/18.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "SecondFunctionBaseViewController.h"
#import "BackButton.h"
@interface SecondFunctionBaseViewController ()

@end

@implementation SecondFunctionBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@synthesize viewcontroller;
@synthesize htmlName;
@synthesize htmlDirectory;
@synthesize functionTitle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //换新的顶部背景
        UIImage *image = [UIImage imageNamed:@"top_bj.91.png"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, 320+2, 48+20+2)];
        imageView.image = image;
        [self.view insertSubview:imageView atIndex:0];
        
        returnButton = [[BackButton alloc] initWithFrame:CGRectMake(-2+10, -2+20 + 6, 150, 48-20)];
        
        //换返回按钮图标和文字
        UIImage *image1 = [UIImage imageNamed:@"biz_pics_main_back_normal.png"];
        [returnButton setImage:image1 forState:UIControlStateNormal];
        [self.view insertSubview:returnButton atIndex:1];
        [returnButton addTarget:self action:@selector(btnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
        
        //返回图标
//        UIImage *image4 = [UIImage imageNamed:@"biz_widget_left.9.png"];
//        UIImageView *imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2+20+6, 20+2, 48-20)];
//        imageView4.image = image4;
//        [self.view insertSubview:imageView4 atIndex:1];
        
        //tab栏背景图标
        UIImage *image2 = [UIImage imageNamed:@"tab.png"];
        UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(-2, 48+20, 320+2, 48+2-2)];
        imageView2.image = image2;
        [self.view insertSubview:imageView2 atIndex:0];
        
        viewcontroller = [[EasyJSWebView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+48+20, self.view.frame.size.width, self.view.frame.size.height - 48-20)];
        
        [self InitFunctionView];
        //用于webviewdelegate中判断是否为单webview类型
        self.viewcontroller.isNoresizeFrameForEasy = YES;
        
        [returnButton setTitle:functionTitle forState:UIControlStateNormal];
        
        [self.viewcontroller loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:htmlName ofType:nil inDirectory:htmlDirectory]]]];
        [self.view addSubview:viewcontroller];
    }
    return self;
}
-(void)InitFunctionView
{
    
}
- (void)btnClicked:(id)sender event:(id)event
{
    if ([[(BackButton*)sender titleLabel].text isEqualToString:@"返回"])
    {
        [(BackButton*)sender setTitle:functionTitle forState:UIControlStateNormal];
        if (viewcontroller.canGoBack == YES)
        [viewcontroller goBack];
    }else{
    [self dismissViewControllerAnimated:YES completion:nil];
    }
}
-(NSString*) ExeJsCode:(NSString*)jsCode
{
    return [viewcontroller stringByEvaluatingJavaScriptFromString:jsCode];
}
@end
