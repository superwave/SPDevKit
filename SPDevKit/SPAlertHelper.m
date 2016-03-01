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
-(void)showSimpleAlertWithTitle:(NSString *)title message:(NSString *)message handler:voidBlock handler showOn:(UIViewController *)viewController
{
    if([UIAlertController class]){
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title
                                                                        message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act = [UIAlertAction actionWithTitle:self.confirmBtnTitle?:@"ok"                                                  style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            if(handler) handler();
        }];
        [alertC addAction:act];
        
        [viewController presentViewController:alertC animated:YES completion:nil];
    }
    else if([UIAlertView class]){
        UIBAlertView *alert = [[UIBAlertView alloc]initWithTitle:title message:message cancelButtonTitle:self.confirmBtnTitle?:@"ok" otherButtonTitles:nil, nil];
        [alert showWithDismissHandler:^(NSInteger selectedIndex, NSString *selectedTitle, BOOL didCancel) {
            if(didCancel){
                if(handler)handler();
            }
        }];
    }
}
-(void)showDestructAlertWithTitle:(NSString *)title message:(NSString *)message cancelHandler:voidBlock cancelHandler destructButtonTitle:(NSString *)destructTitle destructHandler:voidBlock destructHandler showOn:(UIViewController *)viewContorller
{
    if([UIAlertController class]){
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title
                                                                        message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act_confirm = [UIAlertAction actionWithTitle:destructTitle
                                                              style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                                                                  if(destructHandler)destructHandler();
                                                              }];
        
        UIAlertAction *act_cancel = [UIAlertAction actionWithTitle:self.cancelBtnTitle?:@"cancel"
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action){
                                                               if(cancelHandler)cancelHandler();
                                                           }];
        
        [alertC addAction:act_confirm];
        [alertC addAction:act_cancel];
        
        [viewContorller presentViewController:alertC animated:YES completion:nil];
    }
    else if ([UIAlertView class]){
        UIBAlertView *alert = [[UIBAlertView alloc]initWithTitle:title message:message cancelButtonTitle:self.cancelBtnTitle?:@"cancel" otherButtonTitles:destructTitle, nil];
        [alert showWithDismissHandler:^(NSInteger selectedIndex, NSString *selectedTitle, BOOL didCancel) {
            if(didCancel){
                if(cancelHandler)cancelHandler();
            }
            else {
                if(destructHandler)destructHandler();
            }
        }];
    }
}
-(void)showActionList:(NSArray *)actions title:(NSString *)title message:(NSString *)message cancelHandler:voidBlock cancelHandler showOn:(UIViewController *)viewContorller{
    if([UIAlertController class]){
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
                                                           handler:^(UIAlertAction *action){
                                                               if(cancelHandler)cancelHandler();
                                                           }];
        [alertC addAction:act_cancel];
        [viewContorller presentViewController:alertC animated:YES completion:nil];
    }
    else{
        //Action Sheet for ios7
    }
}
@end
