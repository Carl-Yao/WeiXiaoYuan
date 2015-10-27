//
//  DetailForMessageViewController.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 15/1/5.
//  Copyright (c) 2015年 Dukeland. All rights reserved.
//

#import "DetailForMessageViewController.h"
#import "BackButton.h"
#import "InTimeViewController.h"
#import "DBImageView.h"
#import "SJAvatarBrowser.h"

@interface DetailForMessageViewController ()
{
    UIImageView* imageViewNormal;
    //DBImageView *imageViewNormal;
    DBImageView * downloadImageView;
    NSString* imagePath;
}
@end

@implementation DetailForMessageViewController
@synthesize userMessages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"";
        
        self.view.backgroundColor = [UIColor lightGrayColor];
        
        //换新的顶部背景
        UIImage *image = [UIImage imageNamed:@"top.png"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-2, -2, 320+2, 64+2)];
        imageView.image = image;
        [self.view insertSubview:imageView atIndex:0];
        
        BackButton *returnButton = [[BackButton alloc] initWithFrame:CGRectMake(-2+10, -2+20 + 6, 150, 48-20)];
        [returnButton setTitle:((AppDelegate *)[[UIApplication sharedApplication] delegate]).titlesDictionary[userMessages.pushType] forState:UIControlStateNormal];
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
        
        //下面内容的背景
//        UIImage *appButtonImagetitle = [UIImage imageNamed:@"chat_bg_default.jpg"];
//        UIImageView* bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+64, self.view.frame.size.width, self.view.frame.size.height - 64)];
//        [bgImageView setImage:appButtonImagetitle];
//        [self.view insertSubview:bgImageView atIndex:0];
        [self.view setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0]];
        //布局显示内容
        CGFloat heightLayout = 64;
        if ([userMessages.pushType isEqualToString:@"zf"]) {
            //to do
            if (userMessages.pushContent) {
                UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, heightLayout+10, self.view.frame.size.width-20, 30)];
                label.text = [NSString stringWithFormat:@"  %@:%@", userMessages.pushTitle, userMessages.pushContent];
                label.textAlignment = NSTextAlignmentLeft;
                label.font = [UIFont boldSystemFontOfSize:18];
                //label.textColor = [UIColor greenColor];
                [self.view insertSubview:label atIndex:2];
                //heightLayout = heightLayout + 10 + 30;
                
                //换行
                CGSize labelSize = {0, 0};
                labelSize = [[NSString stringWithFormat:@"  %@:%@", userMessages.pushTitle, userMessages.pushContent] sizeWithFont:[UIFont systemFontOfSize:18]
                                                 constrainedToSize:CGSizeMake(label.frame.size.width, 5000)
                                                     lineBreakMode:UILineBreakModeWordWrap];
                //14 为UILabel的字体大小
                //200为UILabel的宽度，5000是预设的一个高度，表示在这个范围内
                label.numberOfLines = 0;//表示label可以多行显示
                label.lineBreakMode = UILineBreakModeCharacterWrap;//换行模式，与上面的计算保持一致。
                label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, labelSize.height);//保持原来Label的位置和宽度，只是改变高度。
                heightLayout += labelSize.height + 10;
            }
            if (userMessages.pushSender) {
                UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, heightLayout+10, self.view.frame.size.width-20, 24)];
                label.text = userMessages.pushSender;
                label.textAlignment = NSTextAlignmentRight;
                label.font = [UIFont boldSystemFontOfSize:16];
                //label.textColor = [UIColor grayColor];
                [self.view insertSubview:label atIndex:2];
                heightLayout = heightLayout + 10 + 30;
            }
            if (userMessages.pushDate) {
                UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, heightLayout+10, self.view.frame.size.width-20, 24)];
                label.text = userMessages.pushDate;
                label.textAlignment = NSTextAlignmentRight;
                label.font = [UIFont boldSystemFontOfSize:14];
                label.textColor = [UIColor grayColor];
                [self.view insertSubview:label atIndex:2];
                heightLayout = heightLayout + 10 + 30;
            }
            if (userMessages.pushImage)
            {
                downloadImageView =[[DBImageView alloc] initWithFrame:CGRectMake(0,0,0,0)];
                [downloadImageView setImageWithPath:userMessages.pushImage];
                
                //UIImage *pushImage = [UIImage imageNamed:userMessages.pushImage];
                CGFloat height = self.view.frame.size.height - heightLayout -20 >self.view.frame.size.width-20?self.view.frame.size.height - heightLayout -20:self.view.frame.size.width-20;
                
                imageViewNormal = [[UIImageView alloc] initWithFrame:CGRectMake(10, heightLayout + 10, self.view.frame.size.width-20, height)];
                
                [imageViewNormal setImage:downloadImageView.MyImage];
                [self.view insertSubview:imageViewNormal atIndex:2];
                heightLayout = heightLayout + 10 + 160;
            }
        }else{
            if (userMessages.pushImage)
            {
                downloadImageView =[[DBImageView alloc] initWithFrame:CGRectMake(0,0,0,0)];
                [downloadImageView setImageWithPath:userMessages.pushImage];
                
                //UIImage *pushImage = [UIImage imageNamed:imagePath];
                imageViewNormal = [[DBImageView alloc] initWithFrame:CGRectMake(80, heightLayout + 10, self.view.frame.size.width-160, 160)];
                
                [imageViewNormal setImage:downloadImageView.MyImage];
                
                //无图片不显示
                if (downloadImageView.MyImage) {
                    [self.view insertSubview:imageViewNormal atIndex:2];
                    heightLayout = heightLayout + 10 + 160;
                }
                
            }
            if (userMessages.pushTitle) {
                UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, heightLayout+10, self.view.frame.size.width, 30)];
                label.text = userMessages.pushTitle;
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont boldSystemFontOfSize:18];
                label.textColor = [UIColor greenColor];
                [self.view insertSubview:label atIndex:2];
                heightLayout = heightLayout + 10 + 30;
            }
            if (userMessages.pushSender && userMessages.pushDate) {
                UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, heightLayout+10, self.view.frame.size.width, 30)];
                label.text = [NSString stringWithFormat:@"%@    %@", userMessages.pushSender, userMessages.pushDate];
                label.textAlignment = NSTextAlignmentCenter;
                label.font = [UIFont boldSystemFontOfSize:14];
                label.textColor = [UIColor grayColor];
                [self.view insertSubview:label atIndex:2];
                heightLayout = heightLayout + 10 + 30;
            }
            if (userMessages.pushContent) {
                NSString* labelStr = userMessages.pushContent;
                UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, heightLayout+10, self.view.frame.size.width-40, self.view.frame.size.height - heightLayout - 10)];
                label.text = userMessages.pushContent;
                label.textAlignment = NSTextAlignmentLeft;
                label.font = [UIFont systemFontOfSize:16];
                heightLayout = heightLayout + 10 + 30;
                
                CGSize labelSize = {0, 0};
                labelSize = [labelStr sizeWithFont:[UIFont systemFontOfSize:16]
                                 constrainedToSize:CGSizeMake(label.frame.size.width, 5000)
                                     lineBreakMode:UILineBreakModeWordWrap];
                //14 为UILabel的字体大小
                //200为UILabel的宽度，5000是预设的一个高度，表示在这个范围内
                label.numberOfLines = 0;//表示label可以多行显示
                label.lineBreakMode = UILineBreakModeCharacterWrap;//换行模式，与上面的计算保持一致。
                label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, labelSize.height);//保持原来Label的位置和宽度，只是改变高度。
                 [self.view insertSubview:label atIndex:2];
            }
        }
        if (imageViewNormal) {
            imagePath = userMessages.pushImage;
            imageViewNormal.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageHandle)];
            [imageViewNormal addGestureRecognizer:singleTap];
        }        
    }
    return self;
}

- (void)btnClicked:(id)sender event:(id)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
//点击图片，放大
- (void)imageHandle {
    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(160, 300, 1, 1)];
    view.image = downloadImageView.MyImage;
    [SJAvatarBrowser showImage:view];
//    XHImageViewer *imageViewer = [[XHImageViewer alloc] init];
//    imageViewer.delegate = self;
//    NSMutableArray* imageViews = [NSMutableArray array];
//    [imageViews addObject:imageViewNormal];
//    //UIImage* image= [UIImage imageNamed:imagePath];
//    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 200)];
//    [imageView setImage:imageViewNormal.MyImage];
//    [(DBImageView*)imageViewNormal setImageWithPath:imagePath];
//    [imageViewer showWithImageViews:imageViews selectedView:imageView];
}
@end
