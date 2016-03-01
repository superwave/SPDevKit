//
//  SPTabButtonScrollView.m
//  SPDevKit
//
//  Created by Aotter on 2015/12/14.
//  Copyright © 2015年 Aotter. All rights reserved.
//

#import "SPTabButtonScrollView.h"
#import "SPUIHelper.h"

@implementation SPTabButtonScrollView

-(void)initWithArrays:(NSArray<NSString *> *)titles font:(UIFont*)font tintColor:(UIColor *)color{
    self.arrayOfData = titles;
    self.itemInset = 20;
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
    

    
    UIColor *grayColor = [UIColor colorWithWhite:0.451 alpha:1.000];
    NSBundle *frameWorkBundle = [NSBundle bundleForClass:[self class]];
    UIImage *bgImage = [UIImage imageNamed:@"selected_h.png" inBundle:frameWorkBundle compatibleWithTraitCollection:nil];
    
    CGFloat xAis = self.itemInset;
    CGFloat xStart = 0;
    for(int i=0;i<[titles count];i++){
        xStart += xAis;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
        [button sizeToFit];
        button.frame = CGRectMake(xStart,
                                  0,
                                  button.frame.size.width,
                                  self.frame.size.height);
        button.tag = i;
        [button setTitleColor:grayColor forState:UIControlStateNormal];
        [button setTitleColor:color forState:UIControlStateSelected];
        [button setTitleColor:color forState:UIControlStateHighlighted];
        [button setBackgroundImage:bgImage forState:UIControlStateSelected];
        [button addTarget:self action:@selector(onTapTitle:) forControlEvents:UIControlEventTouchUpInside];
        xStart += button.frame.size.width;
        xStart += xAis;
        
        [self addSubview:button];
    }
    self.contentSize = CGSizeMake(xStart,
                                  self.frame.size.height);
    [self setCurrentIndex:0];
}


-(void)setCurrentIndex:(NSUInteger)index{
    for(id subView in self.subviews){
        if([subView isKindOfClass:[UIButton class]]){
            UIButton *btn = (UIButton *)subView;
            [btn setSelected:NO];
            if(btn.tag == (int)index){
                [btn setSelected:YES];
                CGFloat btnOffset = btn.frame.origin.x;
                CGFloat btnWidth = btn.frame.size.width;
                CGFloat newOffset = 0;
                
                if(index == 0){
                    newOffset = 0;
                }
                else if (index > 0 && index < self.arrayOfData.count -1){
                    newOffset = btnOffset - (self.frame.size.width/2 - btnWidth/2);
                }
                else if (index == self.arrayOfData.count -1){
                    newOffset = btnOffset - (self.frame.size.width - btnWidth) + self.itemInset;
                }
                newOffset = (newOffset <= 0)? 0:newOffset;
                [self setContentOffset:CGPointMake(newOffset, 0) animated:YES];
            }
        }
    }
}

-(void)onTapTitle:(id)sender{
    UIButton *btn = (UIButton *)sender;
    NSUInteger index = (NSUInteger)btn.tag;
    NSString *title = [self.arrayOfData objectAtIndex:(int)index];
    [self setCurrentIndex:index];
    [self.SPDelegate onTapSPTabButtonScollViewAtTitle:title index:index];
}



@end
