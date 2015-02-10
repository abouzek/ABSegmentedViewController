//
//  ABTransitionUtility.m
//  Anniversary
//
//  Created by Alan Bouzek on 12/11/14.
//  Copyright (c) 2014 Alan Bouzek. All rights reserved.
//

#import "ABTransitionUtility.h"

@implementation ABTransitionUtility

+(void)slideTransitionFromView:(UIView *)fromView
                        toView:(UIView *)toView
                 usingDuration:(CGFloat)duration
             springWithDamping:(CGFloat)springDamping
         initialSpringVelocity:(CGFloat)springVelocity
                       options:(UIViewAnimationOptions)options
                 withDirection:(SlideDirection)direction
           withCompletionBlock:(AVCompletionBlock)completion {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    CGRect toViewStartFrame = toView.frame;
    CGRect toViewEndFrame = fromView.frame;
    CGRect fromViewEndFrame = fromView.frame;
    
    switch (direction) {
        case Left:
            toViewStartFrame.origin.x = screenSize.width;
            fromViewEndFrame.origin.x = -screenSize.width;
            break;
        case Right:
            toViewStartFrame.origin.x = -screenSize.width;
            fromViewEndFrame.origin.x = screenSize.width;
            break;
    }
    
    [fromView.superview addSubview:toView];
    toView.frame = toViewStartFrame;
    
    [UIView animateWithDuration:duration delay:0
         usingSpringWithDamping:springDamping
          initialSpringVelocity:springVelocity
                        options:options
                     animations:^{
        toView.frame = toViewEndFrame;
        fromView.frame = fromViewEndFrame;
    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        !completion ?: completion();
    }];
}

@end
