//
//  ABSegmentedViewController.h
//  Anniversary
//
//  Created by Alan Bouzek on 1/21/15.
//  Copyright (c) 2015 Alan Bouzek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABSegmentedViewController : UIViewController

+(instancetype)segmentedContainerViewControllerWithViewControllers:(NSArray *)viewControllers
                                            selectedTextAttributes:(NSDictionary *)selectedTextAttributes
                                          deselectedTextAttributes:(NSDictionary *)deselectedTextAttributes
                                           selectedBackgroundColor:(UIColor *)selectedBackgroundColor
                                         deselectedBackgroundColor:(UIColor *)deselectedBackgroundColor;

@end
