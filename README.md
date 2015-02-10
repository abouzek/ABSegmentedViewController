# ABSegmentedViewController

[![Version](https://img.shields.io/cocoapods/v/ABSegmentedViewController.svg?style=flat)](http://cocoadocs.org/docsets/ABSegmentedViewController)
[![License](https://img.shields.io/cocoapods/l/ABSegmentedViewController.svg?style=flat)](http://cocoadocs.org/docsets/ABSegmentedViewController)
[![Platform](https://img.shields.io/cocoapods/p/ABSegmentedViewController.svg?style=flat)](http://cocoadocs.org/docsets/ABSegmentedViewController)

## Description

A segmented control driven view controller container for two tabs designed with a flat interface. The selection/deselection colors and font attributes are fully customizable, and the interface simple to use.

## Example

![alt tag](https://www.github.com/abouzek/ABSegmentedViewController/raw/master/example.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

An instance of ABSegmentedViewController should be created using the static initializer:

	+(instancetype) ABSegmentedViewController segmentedContainerViewControllerWithViewControllers:(NSArray *)viewControllers
    													    selectedTextAttributes:(NSDictionary *)selectedTextAttributes 
                                                           deselectedTextAttributes:(NSDictionary *)deselectedTextAttributes 	
                                                           selectedBackgroundColor:(UIColor *)selectedBackgroundColor
                                                           deselectedBackgroundColor:(UIColor *)deselectedBackgroundColor

* The viewControllers NSArray should contain UIViewControllers which implement the included AVSegmentedInternalViewController protocol (AVSegmentedInternalViewController.h).

* The textAttributes NSDictionaries are standard attributed text attribute NSDictionaries. 

* The selected and deselected terms refer to the state of the segments in the segmented control.

## Installation

ABSegmentedViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "ABSegmentedViewController"

## Author

Alan Bouzek, github: abouzek, alan.bouzek@gmail.com

## License

ABSegmentedViewController is available under the MIT license. See the LICENSE file for more info.

