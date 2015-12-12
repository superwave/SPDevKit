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



+(void)setMaskColorForButtonImage:(NSArray<UIButton *> *)buttons color:(UIColor *)color forState:(UIControlState)state{
    for(UIButton *button in buttons){
        @try {
            [button setImage:[button.imageView.image maskImageWithColor:color]forState:state];
        }
        @catch (NSException *exception) {
            NSLog(@"[SPUIHelper] set button Image color exception:%@ for button:%@",exception.description,button);
        }
    }
}

@end

@implementation UIImage (Additions)

-(UIImage *)maskImageWithColor:(UIColor *)color{
    UIImage *image = self;
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

-(UIImage *)resizeImageToFitInSize:(CGSize)toSize{
    UIImage *image = self;
    
    UIImage *result = image;
    CGSize sourceSize = image.size;
    CGSize targetSize = toSize;
    
    BOOL needsRedraw = NO;
    
    // Check if width of source image is greater than width of target image
    // Calculate the percentage of change in width required and update it in toSize accordingly.
    
    if (sourceSize.width > toSize.width) {
        
        CGFloat ratioChange = (sourceSize.width - toSize.width) * 100 / sourceSize.width;
        
        toSize.height = sourceSize.height - (sourceSize.height * ratioChange / 100);
        
        needsRedraw = YES;
    }
    
    // Now we need to make sure that if we chnage the height of image in same proportion
    // Calculate the percentage of change in width required and update it in target size variable.
    // Also we need to again change the height of the target image in the same proportion which we
    /// have calculated for the change.
    
    if (toSize.height < targetSize.height) {
        
        CGFloat ratioChange = (targetSize.height - toSize.height) * 100 / targetSize.height;
        
        toSize.height = targetSize.height;
        toSize.width = toSize.width + (toSize.width * ratioChange / 100);
        
        needsRedraw = YES;
    }
    
    // To redraw the image
    
    if (needsRedraw) {
        UIGraphicsBeginImageContext(toSize);
        [image drawInRect:CGRectMake(0.0, 0.0, toSize.width, toSize.height)];
        result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    // Return the result
    
    return result;
    
}
@end
