//
//  NotifyBaseViewController.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/27.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EasyJSWebView.h"
#import "IQActionSheetPickerView.h"
#import "VPImageCropperViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface NotifyBaseViewController : UIViewController<IQActionSheetPickerViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>
{
    NSString* divName;
}
@property (nonatomic, strong) UIImageView *portraitImageView;
-(NSString*) ExeJsCode:(NSString*)jsCode;
@end
