//
//  GrowthTree.m
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/20.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "GrowthTree.h"

@implementation GrowthTree
- (NSString*)getWidth
{
    //not do
    return @"320";
}
- (NSString*)getHeight
{
    //not do
    return @"400";
}
- (NSString*)getgrowtreepic:(NSString*)student_id
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getgrowtreepic:student_id];
    return str;
}

//照相
- (void)setImage
{
    return;
}
- (NSString*)addgrowtree:(NSString*)student_id:(NSString*)title:(NSString*)content:(NSString*)treeDate:(NSString*)address:(NSString*)imgPath
{
    _webServiceController = [WebServiceController shareController:nil];

    NSString * str = [_webServiceController addgrowtree:student_id:title:content:treeDate:address:[super Base64OfTestPhote:imgPath]];
    return str;
}

- (NSString*)getgrowtreeidallpic:(NSString*)studentId:(NSString*)treeId
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController getgrowtreeidallpic:studentId:treeId];
    return str;
}
- (NSString*)addgrowtreepic:(NSString*)studentId:(NSString*)treeId:(NSString*)imgPath
{
    _webServiceController = [WebServiceController shareController:nil];
    
    NSString * str = [_webServiceController addgrowtreepic:studentId:treeId:[super Base64OfTestPhote:imgPath]];
    if (str != nil){
    return @"true";
    }else{
        return @"false";
    }
}

@end
