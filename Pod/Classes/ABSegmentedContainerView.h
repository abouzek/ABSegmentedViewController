//
//  ABSegmentedContainerView.h
//  Anniversary
//
//  Created by Alan Bouzek on 1/22/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABTransitionUtility.h"

@protocol AVSegmentedContainerViewDelegate;


@interface ABSegmentedContainerView : UIView

@property (weak, nonatomic) id<AVSegmentedContainerViewDelegate> delegate;

-(void)setupSegmentedControlWithViewControllers:(NSArray *)viewControllers
                         selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                       deselectedTextAttributes:(NSDictionary *)deselectedTextAttributes
                        selectedBackgroundColor:(UIColor *)selectedBackgroundColor
                      deselectedBackgroundColor:(UIColor *)deselectedBackgroundColor;
-(void)transitionFromView:(UIView *)fromView
                   toView:(UIView *)toView
            withDirection:(SlideDirection)direction
      withCompletionBlock:(AVCompletionBlock)completionBlock;

@end


@protocol AVSegmentedContainerViewDelegate <NSObject>

-(void)segmentedContainerView:(ABSegmentedContainerView *)segmentedContainerView
             didSwitchToIndex:(NSUInteger)index;

@end
