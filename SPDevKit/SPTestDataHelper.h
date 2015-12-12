//
//  SPTestDataHelper.h
//  SPDevKit
//
//  Created by Aotter on 2015/12/12.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    SPTestStrTypeEngUpper,
    SPTestStrTypeEngLower,
    SPTestStrTypeZn,
    SPTestStrTypeNum
}SPTestStrType;


enum months {Jan,Feb};

@interface SPTestDataHelper : NSObject
+(NSString *)randomStringWithTypes:(NSArray *)types length:(int)length;
+(NSString *)imageUrlWithRandomImage:(int)width height:(int)height;
+(NSString *)imageUrlWithPlaceholdit:(int)width height:(int)height;
@end
