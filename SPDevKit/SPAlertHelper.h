//
//  SPAlertHelper.h
//  SPDevKit
//
//  Created by Aotter on 2015/8/17.
//  Copyright (c) 2015年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SPAlertHelper : NSObject
+(SPAlertHelper *)shareInstance;
-(void)setTitle:(NSString *)title;
-(void)showSimpleAlertOn:(UIViewController *)viewC;
@end
