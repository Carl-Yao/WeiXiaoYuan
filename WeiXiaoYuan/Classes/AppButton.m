//
//  AppButton.m
//  AppManage
//
//  Created by chen on 13-5-29.
//  Copyright (c) 2013年 chen. All rights reserved.
//

#import "AppButton.h"

@implementation CAppButton

+ (CAppButton*)BtnWithType:(UIButtonType)buttonType
{
    CAppButton *btn = [CAppButton buttonWithType:buttonType];
	btn.backgroundColor=[UIColor clearColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    return btn;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
	return bounds;
}

- (CGRect)contentRectForBounds:(CGRect)bounds
{
	return bounds;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
	return CGRectMake(contentRect.origin.x-14, contentRect.origin.y + contentRect.size.height/3*2, contentRect.size.width+28, contentRect.size.height/3*1);
}

- (CGRect)imageRectForContentRect:(CGRect)bounds
{
    return CGRectMake(bounds.origin.x+4, bounds.origin.y, bounds.size.width-8, bounds.size.height/3*2);
}

@end
