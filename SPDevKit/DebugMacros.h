//
//  DebugMacros.h
//  SPDevKit
//
//  Created by Aotter on 2015/8/19.
//  Copyright (c) 2015年 Aotter. All rights reserved.
//

#import <Foundation/Foundation.h>

//ShortLog
#if __has_feature(objc_arc)
#define ShortLog(format, ...) CFShow((__bridge CFStringRef)[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define ShortLog(format, ...) CFShow([NSString stringWithFormat:format, ## __VA_ARGS__]);
#endif

#define SPLog(fmt, ...) ShortLog((@"<<%s[Line:%d]>> " fmt), __func__, __LINE__, ##__VA_ARGS__)

//color logs (using XcodeColors)
#define XC_ESCAPE             @"\033["
#define XC_RESET_FG  XC_ESCAPE @"fg;" // Clear any foreground color
#define XC_RESET_BG  XC_ESCAPE @"bg;" // Clear any background color
#define XC_RESET     XC_ESCAPE @";"   // Clear any foreground or background color
#define XCFGTXT(fmt,color) XC_ESCAPE @"fg" color @";" fmt XC_RESET


#define SPLogRed(fmt, ...) ShortLog((XCFGTXT(@"<<%s[Line:%d]>> ", @"220,80,80") XCFGTXT(fmt,@"220,0,0")),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#define SPLogBlue(fmt, ...) ShortLog((XCFGTXT(@"<<%s[Line:%d]>> ", @"80,80,220") XCFGTXT(fmt,@"0,0,220")),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#define SPLogGreen(fmt, ...) ShortLog((XCFGTXT(@"<<%s[Line:%d]>> ", @"80,220,80") XCFGTXT(fmt,@"0,220,0")),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#define SPLogCyan(fmt, ...) ShortLog((XCFGTXT(@"<<%s[Line:%d]>> ", @"80,225,255") XCFGTXT(fmt,@"0,225,255")),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#define SPLogYellow(fmt, ...) ShortLog((XCFGTXT(@"<<%s[Line:%d]>> ", @"250,225,80") XCFGTXT(fmt,@"255,225,0")),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)

#define ShortLogGray(fmt, ...) ShortLog(XCFGTXT(fmt,@"100,100,100"), ##__VA_ARGS__)
#define ShortLogYellow(fmt, ...) ShortLog(XCFGTXT(fmt,@"255,255,0"), ##__VA_ARGS__)
#define ShortLogRed(fmt, ...) ShortLog(XCFGTXT(fmt,@"220,0,0"), ##__VA_ARGS__)
#define ShortLogGreen(fmt, ...) ShortLog(XCFGTXT(fmt,@"0,220,0"), ##__VA_ARGS__)
#define ShortLogCyan(fmt, ...) ShortLog(XCFGTXT(fmt,@"0,220,220"), ##__VA_ARGS__)
#define ShortLogBlue(fmt, ...) ShortLog(XCFGTXT(fmt,@"0,0,220"), ##__VA_ARGS__)



//#define NSLogGray(fmt, ...) NSLog(XCFGTXT(fmt,@"100,100,100"), ##__VA_ARGS__)
//#define NSLogYellow(fmt, ...) NSLog(XCFGTXT(fmt,@"255,255,0"), ##__VA_ARGS__)
//#define NSLogRed(fmt, ...) NSLog(XCFGTXT(fmt,@"220,0,0"), ##__VA_ARGS__)
//#define NSLogGreen(fmt, ...) NSLog(XCFGTXT(fmt,@"0,220,0"), ##__VA_ARGS__)
//#define NSLogCyan(fmt, ...) NSLog(XCFGTXT(fmt,@"0,220,220"), ##__VA_ARGS__)
//#define NSLogBlue(fmt, ...) NSLog(XCFGTXT(fmt,@"0,0,220"), ##__VA_ARGS__)

#define NSLogGray(fmt, ...) if([DebugMacros sharedInstance].isEnableXcodeColor){NSLog(XCFGTXT(fmt,@"100,100,100"), ##__VA_ARGS__);}else{NSLog(fmt, ##__VA_ARGS__);}
#define NSLogYellow(fmt, ...) if([DebugMacros sharedInstance].isEnableXcodeColor){NSLog(XCFGTXT(fmt,@"255,255,0"), ##__VA_ARGS__);}else{NSLog(fmt, ##__VA_ARGS__);}
#define NSLogRed(fmt, ...) if([DebugMacros sharedInstance].isEnableXcodeColor){NSLog(XCFGTXT(fmt,@"220,0,0"), ##__VA_ARGS__);}else{NSLog(fmt, ##__VA_ARGS__);}
#define NSLogGreen(fmt, ...) if([DebugMacros sharedInstance].isEnableXcodeColor){NSLog(XCFGTXT(fmt,@"0,220,0"), ##__VA_ARGS__);}else{NSLog(fmt, ##__VA_ARGS__);}
#define NSLogCyan(fmt, ...) if([DebugMacros sharedInstance].isEnableXcodeColor){NSLog(XCFGTXT(fmt,@"0,220,220"), ##__VA_ARGS__);}else{NSLog(fmt, ##__VA_ARGS__);}
#define NSLogBlue(fmt, ...) if([DebugMacros sharedInstance].isEnableXcodeColor){NSLog(XCFGTXT(fmt,@"0,0,220"), ##__VA_ARGS__);}else{NSLog(fmt, ##__VA_ARGS__);}


@interface DebugMacros : NSObject
@property BOOL isEnableXcodeColor;
+(DebugMacros *)sharedInstance;
-(void)enableXcodeColor;
@end
