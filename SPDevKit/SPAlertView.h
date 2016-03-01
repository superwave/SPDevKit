//
//  SPAlertView.h
//  SPDevKit
//
//  Created by Aotter on 2016/3/1.
//  Copyright © 2016年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SPAlertViewDelegate <NSObject>
-(void)didClickCancel:(void(^)(void))handler;

@end

@interface SPAlertView : NSObject
-(id)initWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle;
@end
