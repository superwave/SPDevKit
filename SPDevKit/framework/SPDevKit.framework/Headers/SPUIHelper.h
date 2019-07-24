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
+(void)setMaskColorForButtonImage:(NSArray<UIButton *> *)buttons color:(UIColor *)color forState:(UIControlState)state;
@end

@interface UIImage(Additions)
-(UIImage *)maskImageWithColor:(UIColor *)color;
-(UIImage *)resizeImageToFitInSize:(CGSize)toSize;
@end