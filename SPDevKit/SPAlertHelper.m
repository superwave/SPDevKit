//
//  SPAlertHelper.m
//  SPDevKit
//
//  Created by Aotter on 2015/8/17.
//  Copyright (c) 2015年 Aotter. All rights reserved.
//

#import "SPAlertHelper.h"


@interface SPAlertHelper()
@property NSString *confirmBtnTitle;
@property NSString *cancelBtnTitle;
@end

@implementation SPAlertHelper
+(SPAlertHelper *)shareInstance
{
    static dispatch_once_t once;
    static SPAlertHelper *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)setLocalizedConfirmButtonTitle:(NSString *)title
{
    self.confirmBtnTitle = title;
}
-(void)setLocalizedCancelButtonTitle:(NSString *)title
{
    self.cancelBtnTitle = title;
}
-(void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message handler:actionBlock handler showOn:(UIViewController *)viewController
{
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title
                                                                    message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:self.confirmBtnTitle?:@"ok"                                                  style:UIAlertActionStyleDefault handler:handler];
    [alertC addAction:act];
    
    [viewController presentViewController:alertC animated:YES completion:nil];
}
-(void)showDestructAlertWithTitle:(NSString *)title message:(NSString *)message cancelHandler:actionBlock cancelHandler destructButtonTitle:(NSString *)destructTitle destructHandler:actionBlock destructHandler showOn:(UIViewController *)viewContorller
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title
                                                                    message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act_confirm = [UIAlertAction actionWithTitle:destructTitle
                                                          style:UIAlertActionStyleDestructive handler:destructHandler];
    
    UIAlertAction *act_cancel = [UIAlertAction actionWithTitle:self.cancelBtnTitle?:@"cancel"
                                                         style:UIAlertActionStyleDefault
                                                       handler:cancelHandler];
    
    [alertC addAction:act_confirm];
    [alertC addAction:act_cancel];
    
    [viewContorller presentViewController:alertC animated:YES completion:nil];
}
-(void)showActionList:(NSArray *)actions title:(NSString *)title message:(NSString *)message cancelHandler:actionBlock cancelHandler showOn:(UIViewController *)viewContorller{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title
                                                                    message:message preferredStyle:UIAlertControllerStyleActionSheet];
    for(id obj in actions){
        if([obj isKindOfClass:[UIAlertAction class]]){
            UIAlertAction *action = (UIAlertAction *)obj;
            [alertC addAction:action];
        }
    }

    UIAlertAction *act_cancel = [UIAlertAction actionWithTitle:self.cancelBtnTitle?:@"cancel"
                                                         style:UIAlertActionStyleDefault
                                                       handler:cancelHandler];
    [alertC addAction:act_cancel];
    [viewContorller presentViewController:alertC animated:YES completion:nil];
}
@end
