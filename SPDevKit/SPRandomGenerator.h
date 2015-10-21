//
//  SPRandomGenerator.h
//  SPDevKit
//
//  Created by Aotter on 2015/10/21.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SPRandomGenerator : NSObject
+(NSString *)randomEngWithLength:(int)len hasCapital:(BOOL)hasCapital;
+(NSString *)randomChrWithLength:(int)len hasCapital:(BOOL)hasCapital;
+(NSString *)randomZhWithLength:(int)len;

+(NSString *)generateRandomStringWithBase:(NSString *)base length:(int)len;
+(NSString *)randomImageUrl:(int)width :(int)height;

@end
