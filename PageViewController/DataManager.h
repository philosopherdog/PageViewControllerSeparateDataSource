//
//  DataManager.h
//  PageViewController
//
//  Created by steve on 2016-05-20.
//  Copyright © 2016 steve. All rights reserved.
//

@import UIKit;
@class ViewController;

// I added this class when refactoring
// Remember Model classes shouldn't be in the VIEWController!
// I'm making the dataManager the PageViewController's data source

@interface DataManager : NSObject<UIPageViewControllerDataSource>
@property (nonatomic) UIStoryboard *storyboard;
- (ViewController *)createViewControllerAtIndex:(NSInteger)index;
@end
