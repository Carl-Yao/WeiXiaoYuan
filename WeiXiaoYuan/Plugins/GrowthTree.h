//
//  GrowthTree.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServiceController.h"
#import "JsPluginBase.h"
@interface GrowthTree : JsPluginBase
{
    WebServiceController *_webServiceController;
}
- (NSString*)getgrowtreepic:(NSString*)student_id;
- (NSString*)getWidth;
- (NSString*)getHeight;
//照相
- (void)setImage;
- (NSString*)addgrowtree:(NSString*)student_id:(NSString*)title:(NSString*)content:(NSString*)treeDate:(NSString*)address:(NSString*)imgPath;
- (NSString*)getgrowtreeidallpic:(NSString*)studentId:(NSString*)treeId;
- (NSString*)addgrowtreepic:(NSString*)studentId:(NSString*)treeId:(NSString*)imgPath;

@end
