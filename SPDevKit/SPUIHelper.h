//
//  SPUIHelper.h
//  SPDevKit
//
//  Created by Aotter on 2015/10/21.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SPUIHelper : NSObject
+(CGSize)screenSize;
+(UIImage *)maskedImage:(UIImage *)image color:(UIColor *)color;
@end
