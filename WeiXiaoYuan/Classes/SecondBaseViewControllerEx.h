//
//  SecondBaseViewController.h
//  WeiXiaoYuan
//
//  Created by 姚振兴 on 14/12/18.
//  Copyright (c) 2014年 Dukeland. All rights reserved.
//

#import "FunctionBaseViewController.h"
#import "BackButton.h"

typedef void (^BtnClickedBlock)(NSInteger index);

@interface SecondBaseViewControllerEx : UIViewController

- (void)InitWithData;
@property (nonatomic, copy) BtnClickedBlock btnClickedBlock;      ///<点击事件
@property (nonatomic, strong) NSMutableArray* m_arData;
@property (nonatomic, strong) NSMutableArray* m_image;
@property (nonatomic, strong) NSMutableArray* htmlNames;
@property (nonatomic, strong) NSMutableArray* htmlDirectorys;
@property (nonatomic, strong) BackButton *returnButton;
@end
