//
//  FunctionBaseViewController.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/13.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyJSWebView.h"
#import "IQActionSheetPickerView.h"
#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface FunctionBaseViewController : UIViewController <IQActionSheetPickerViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>//, VPImageCropperDelegate>
{
    NSInteger selectIndex;
    NSString* divName;
}
@property (strong,nonatomic) NSMutableArray* easyViewControllers;
@property (strong,nonatomic) NSArray* titles;
@property (strong,nonatomic) NSArray* htmlNames;
@property (strong,nonatomic) NSArray* spaceSizes;
@property (strong,nonatomic) NSArray* htmlDirectorys;
@property (strong,nonatomic) NSString* functionTitle;
@property (nonatomic, strong) UIImageView *portraitImageView;

- (void)InitFunctionView;
- (void)AddEasyJS:(EasyJSWebView*)view;
@end
