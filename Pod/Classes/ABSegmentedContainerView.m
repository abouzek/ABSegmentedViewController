//
//  ABSegmentedContainerView.m
//  Anniversary
//
//  Created by Alan Bouzek on 1/22/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import "ABSegmentedContainerView.h"
#import "ABSegmentedInternalViewController.h"
#import "ABShadowView.h"

@interface ABSegmentedContainerView ()

@property (strong, nonatomic) UIColor *selectedBackgroundColor, *deselectedBackgroundColor;

@property (strong, nonatomic) IBOutlet ABShadowView *segmentedControlView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@end


@implementation ABSegmentedContainerView

#pragma mark - setup methods

-(void)setupSegmentedControlWithViewControllers:(NSArray *)viewControllers
                         selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                       deselectedTextAttributes:(NSDictionary *)deselectedTextAttributes
                        selectedBackgroundColor:(UIColor *)selectedBackgroundColor
                      deselectedBackgroundColor:(UIColor *)deselectedBackgroundColor {
    self.selectedBackgroundColor = selectedBackgroundColor;
    self.deselectedBackgroundColor = deselectedBackgroundColor;
    
    [self setupSegmentedControlStyleWithSelectedTextAttributes:selectedTextAttributes
                                      deselectedTextAttributes:deselectedTextAttributes];
    [self setupSegmentedControlSegmentsWithViewControllers:viewControllers];
}

-(void)setupSegmentedControlStyleWithSelectedTextAttributes:(NSDictionary *)selectedTextAttributes
                                   deselectedTextAttributes:(NSDictionary *)deselectedTextAttributes {
    self.segmentedControl.layer.cornerRadius = 0;
    self.segmentedControl.layer.borderWidth = 0;
    self.segmentedControl.layer.borderColor = [[UIColor clearColor] CGColor];
    
    [self.segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    [self.segmentedControl setTitleTextAttributes:deselectedTextAttributes forState:UIControlStateNormal];
}

-(void)setupSegmentedControlSegmentsWithViewControllers:(NSArray *)viewControllers {
    [self.segmentedControl removeAllSegments];
    for (int i = 0; i < viewControllers.count; ++i) {
        id<ABSegmentedInternalViewController> viewController = viewControllers[i];
        [self.segmentedControl insertSegmentWithTitle:[viewController titleForSegment]
                                              atIndex:i
                                             animated:NO];
    }
    [self changeSegmentedControlColors];
    self.segmentedControl.selectedSegmentIndex = 0;
    
    UIViewController *firstViewController = viewControllers.firstObject;
    [self.containerView addSubview:firstViewController.view];
    firstViewController.view.frame = self.containerView.bounds;
}


#pragma mark - transition methods

-(void)changeSegmentedControlColors {
    dispatch_async(dispatch_get_main_queue(), ^{
        for (id subview in self.segmentedControl.subviews) {
            if ([subview respondsToSelector:@selector(isSelected)]) {
                if ([subview isSelected]) {
                    [subview setTintColor:self.selectedBackgroundColor];
                    [subview setBackgroundColor:self.selectedBackgroundColor];
                }
                else {
                    [subview setTintColor:self.deselectedBackgroundColor];
                    [subview setBackgroundColor:self.deselectedBackgroundColor];
                }
            }
        }
    });
}


-(void)transitionFromView:(UIView *)fromView
                   toView:(UIView *)toView
            withDirection:(SlideDirection)direction
      withCompletionBlock:(AVCompletionBlock)completionBlock {
    self.segmentedControl.userInteractionEnabled = NO;
    
    [ABTransitionUtility slideTransitionFromView:fromView
                                          toView:toView
                                   usingDuration:0.35
                               springWithDamping:1
                           initialSpringVelocity:1
                                         options:0
                                   withDirection:direction
                             withCompletionBlock:^{
                                 
                                 toView.frame = self.containerView.bounds;
                                 
                                 self.segmentedControl.userInteractionEnabled = YES;
                                 !completionBlock ?: completionBlock();
                                 
                             }
     ];
}


#pragma mark - IBAction methods

- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender {
    [self changeSegmentedControlColors];
    [self.delegate segmentedContainerView:self
                         didSwitchToIndex:sender.selectedSegmentIndex];
}

@end
