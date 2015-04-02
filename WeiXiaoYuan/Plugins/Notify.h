//
//  Notify.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface Notify : JsPluginBase
{
    WebServiceController *_webServiceController;
}

- (NSString*)getWidth;
- (NSString*)getHeight;
- (NSString*)noticeadd:(NSString*)group_id:(NSString*)rangeValue:(NSString*)title:(NSString*)notice_info:(NSString*)imgPath;
- (void)closePage;
- (void)setImage;
- (void)viewPhoto:imgPath;
- (NSString*)noticeinfo:notice_id;
- (NSString*)noticelist;
@end
