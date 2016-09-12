//
//  DebugMacros.m
//  SPDevKit
//
//  Created by Aotter on 2015/8/19.
//  Copyright (c) 2015年 Aotter. All rights reserved.
//

#import "DebugMacros.h"


#define NSLogPrivateGray(fmt, ...) NSLog(XCFGTXT(fmt,@"100,100,100"), ##__VA_ARGS__)
#define NSLogPrivateYellow(fmt, ...) NSLog(XCFGTXT(fmt,@"255,255,0"), ##__VA_ARGS__)
#define NSLogPrivateRed(fmt, ...) NSLog(XCFGTXT(fmt,@"220,0,0"), ##__VA_ARGS__)
#define NSLogPrivateGreen(fmt, ...) NSLog(XCFGTXT(fmt,@"0,220,0"), ##__VA_ARGS__)
#define NSLogPrivateCyan(fmt, ...) NSLog(XCFGTXT(fmt,@"0,220,220"), ##__VA_ARGS__)
#define NSLogPrivateBlue(fmt, ...) NSLog(XCFGTXT(fmt,@"0,0,220"), ##__VA_ARGS__)





@implementation DebugMacros
+(DebugMacros *)sharedInstance{
    static dispatch_once_t onceToken;
    static DebugMacros *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void)enableXcodeColor{
    self.isEnableXcodeColor = YES;
}

@end
