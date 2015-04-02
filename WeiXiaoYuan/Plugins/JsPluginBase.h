//
//  JsPluginBase.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/27.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsPluginBase : NSObject
-(NSString*)ImageToBase64Data:(NSData*)mydata;
-(NSString*)judgeUrlFromCache:(NSString*)picUrl;
-(NSString*)Base64OfTestPhote:(NSString*)imgPath;

@end
