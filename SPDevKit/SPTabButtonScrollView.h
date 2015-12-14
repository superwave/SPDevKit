//
//  SPTabButtonScrollView.h
//  SPDevKit
//
//  Created by Aotter on 2015/12/14.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SPTabButtonScrollViewDelegate <NSObject>
-(void)onTapSPTabButtonScollViewAtTitle:(NSString *)title index:(NSInteger)index;
@end

@interface SPTabButtonScrollView : UIScrollView
@property NSArray<NSString *> *arrayOfData;
@property CGFloat itemInset;
@property (nonatomic,assign) id<SPTabButtonScrollViewDelegate> SPDelegate;
-(void)initWithArrays:(NSArray<NSString *> *)titles font:(UIFont*)font tintColor:(UIColor *)color;
-(void)setCurrentIndex:(NSUInteger)index;
@end
