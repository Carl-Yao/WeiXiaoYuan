//
//  FunctionViewController.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14-10-10.
//
//

#import <UIKit/UIKit.h>
#import "MALTabBarChinldVIewControllerDelegate.h"


@interface FunctionViewController:UIViewController
{
    NSMutableArray *m_arData;
    NSMutableArray *m_image;
}
@property (nonatomic, assign) id<MALTabBarChinldVIewControllerDelegate>delegate;


@end


