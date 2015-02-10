//
//  ABTransitionUtility.h
//  Anniversary
//
//  Created by Alan Bouzek on 12/11/14.
//  Copyright (c) 2014 Alan Bouzek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^AVCompletionBlock)();

typedef NS_ENUM(NSInteger, SlideDirection) {
    Left,
    Right
};


@interface ABTransitionUtility : NSObject

+(void)slideTransitionFromView:(UIView *)fromView
                        toView:(UIView *)toView
                 usingDuration:(CGFloat)duration
             springWithDamping:(CGFloat)springDamping
         initialSpringVelocity:(CGFloat)springVelocity
                       options:(UIViewAnimationOptions)options
                 withDirection:(SlideDirection)direction
           withCompletionBlock:(AVCompletionBlock)completion;

@end
