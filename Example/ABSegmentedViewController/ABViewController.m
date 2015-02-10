//
//  ABViewController.m
//  ABSegmentedViewController
//
//  Created by abouzek on 02/10/2015.
//  Copyright (c) 2014 abouzek. All rights reserved.
//

#import "ABViewController.h"
#import <ABSegmentedViewController/ABSegmentedInternalViewController.h>

@interface ABViewController () <ABSegmentedInternalViewController>

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSString *title;

@end


@implementation ABViewController

-(instancetype)initWithTitle:(NSString *)title {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label.text = self.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ABSegmentedInternalViewController

-(NSString *)titleForSegment {
    return self.title;
}

@end
