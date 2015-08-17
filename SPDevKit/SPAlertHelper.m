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
-(void)setTitle:(NSString *)title
{
    self.confirmBtnTitle = title;
}
-(void)showSimpleAlertOn:(UIViewController *)viewC;
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:self.confirmBtnTitle message:self.confirmBtnTitle preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:self.confirmBtnTitle style:UIAlertActionStyleDefault handler:nil];
    [alertC addAction:act];
    
    [viewC presentViewController:alertC animated:YES completion:nil];
    
}
@end
