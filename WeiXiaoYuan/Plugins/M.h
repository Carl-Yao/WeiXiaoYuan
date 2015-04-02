//
//  M.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/12.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface M : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)getCheckAttendanceId;
@end
