//
//  Extensions.h
//  SPDevKit
//
//  Created by Aotter on 2015/9/24.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Extensions : NSObject

@end

@interface NSDictionary (JSONString)
-(NSString *)jsonStringWithPrettyPrint:(BOOL)prettyPrint;
@end

@interface NSArray (JSONString)
- (NSString *)jsonStringWithPrettyPrint:(BOOL)prettyPrint;
@end
