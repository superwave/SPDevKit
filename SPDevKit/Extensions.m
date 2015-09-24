//
//  Extensions.m
//  SPDevKit
//
//  Created by Aotter on 2015/9/24.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import "Extensions.h"
#import "DebugMacros.h"

@implementation Extensions

@end






@implementation NSDictionary (JSONString)

-(NSString *) jsonStringWithPrettyPrint:(BOOL) prettyPrint {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        ShortLogRed(@"JsonStringWithPrettyPrint(NSDictionary) error: \n%@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
@end


@implementation NSArray (JSONString)
-(NSString *) jsonStringWithPrettyPrint:(BOOL) prettyPrint {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions) (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        ShortLogRed(@"JsonStringWithPrettyPrint(NSArray) error: \n%@", error.localizedDescription);
        return @"[]";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
@end