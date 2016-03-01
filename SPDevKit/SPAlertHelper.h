//
//  SPAlertHelper.h
//  SPDevKit
//
//  Created by Aotter on 2015/8/17.
//  Copyright (c) 2015年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIBAlertView.h"

#define actionBlock (void(^)(UIAlertAction *action))
#define voidBlock (void(^)(void))

@interface SPAlertHelper : NSObject
+(SPAlertHelper *)shareInstance;
-(void)setLocalizedConfirmButtonTitle:(NSString *)title;
-(void)setLocalizedCancelButtonTitle:(NSString *)title;
-(void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message handler:voidBlock handler showOn:(UIViewController *)viewController;
-(void)showDestructAlertWithTitle:(NSString *)title message:(NSString *)message cancelHandler:voidBlock cancelHandler destructButtonTitle:(NSString *)destructTitle destructHandler:voidBlock destructHandler showOn:(UIViewController *)viewContorller;
-(void)showActionList:(NSArray *)actions title:(NSString *)title message:(NSString *)message cancelHandler:voidBlock cancelHandler showOn:(UIViewController *)viewContorller;
@end
