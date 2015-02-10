//
//  ABSegmentedViewController.m
//  Anniversary
//
//  Created by Alan Bouzek on 1/21/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import "ABSegmentedViewController.h"
#import "ABTransitionUtility.h"
#import "ABSegmentedContainerView.h"
#import "ABSegmentedInternalViewController.h"

@interface ABSegmentedViewController () <AVSegmentedContainerViewDelegate>

@property (nonatomic) NSUInteger lastIndex;
@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) NSDictionary *selectedTextAttributes, *deselectedTextAttributes;
@property (strong, nonatomic) UIColor *selectedBackgroundColor, *deselectedBackgroundColor;

@property (strong, nonatomic) IBOutlet ABSegmentedContainerView *segmentedContainerView;

@end


@implementation ABSegmentedViewController

+(instancetype)segmentedContainerViewControllerWithViewControllers:(NSArray *)viewControllers
                                            selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                                          deselectedTextAttributes:(NSDictionary *)deselectedTextAttributes
                                           selectedBackgroundColor:(UIColor *)selectedBackgroundColor
                                         deselectedBackgroundColor:(UIColor *)deselectedBackgroundColor {
    if (!viewControllers || !viewControllers.count) {
        [NSException raise:NSInternalInconsistencyException format:@"AVSegmentedContainerViewController must be initialized with a non-empty array of UIViewControllers."];
    }
    for (UIViewController *viewController in viewControllers) {
        if (![viewController conformsToProtocol:@protocol(ABSegmentedInternalViewController)]) {
            [NSException raise:NSInternalInconsistencyException
                        format:@"AVSegmentedContainerViewController's internal view controllers must implement the AVSegmentedContainerInternalViewController protocol."];
        }
    }
    
    ABSegmentedViewController *container = [[ABSegmentedViewController alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
    container.viewControllers = viewControllers;
    container.selectedBackgroundColor = selectedBackgroundColor;
    container.deselectedBackgroundColor = deselectedBackgroundColor;
    container.selectedTextAttributes = selectedTextAttributes;
    container.deselectedTextAttributes = deselectedTextAttributes;
    
    return container;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lastIndex = 0;
    self.segmentedContainerView.delegate = self;
    [self.segmentedContainerView setupSegmentedControlWithViewControllers:self.viewControllers
                                                   selectedTextAttributes:self.selectedTextAttributes
                                                 deselectedTextAttributes:self.deselectedTextAttributes
                                                  selectedBackgroundColor:self.selectedBackgroundColor
                                                deselectedBackgroundColor:self.deselectedBackgroundColor];
    
    [self addChildViewController:self.viewControllers.firstObject];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - AVSegmentedContainerViewDelegate methods

-(void)segmentedContainerView:(ABSegmentedContainerView *)segmentedContainerView
             didSwitchToIndex:(NSUInteger)index {
    UIViewController *fromViewController = self.viewControllers[self.lastIndex];
    UIViewController *toViewController = self.viewControllers[index];
    SlideDirection direction = self.lastIndex < index ? Left : Right;
    
    [fromViewController removeFromParentViewController];
    [self addChildViewController:toViewController];
    
    [self.segmentedContainerView transitionFromView:fromViewController.view
                                             toView:toViewController.view
                                      withDirection:direction
                                withCompletionBlock:^{
                                    
                                    self.lastIndex = index;
                                    
                                }
     ];
}

@end
