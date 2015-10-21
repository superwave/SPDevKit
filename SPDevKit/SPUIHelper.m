//
//  SPUIHelper.m
//  SPDevKit
//
//  Created by Aotter on 2015/10/21.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import "SPUIHelper.h"

@implementation SPUIHelper
+(CGSize)screenSize{
    CGRect rect = [[UIScreen mainScreen]bounds];
    return rect.size;
}
+(UIImage *)maskedImage:(UIImage *)image color:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
    CGContextRef c = UIGraphicsGetCurrentContext();
    [image drawInRect:rect];
    CGContextSetFillColorWithColor(c, [color CGColor]);
    CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
    CGContextFillRect(c, rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}
@end
