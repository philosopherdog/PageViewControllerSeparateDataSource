//
//  DataManager.m
//  PageViewController
//
//  Created by steve on 2016-05-20.
//  Copyright © 2016 steve. All rights reserved.
//

#import "DataManager.h"
#import "ViewController.h"
#import "Photo.h"

@interface DataManager()
@property (nonatomic) NSArray<Photo*>*data;
@end

@implementation DataManager


- (instancetype)init {
    // here I'm using an early return on init fail to make my code easier to read. No brackets!
    
    if (![super init]) {return nil;}
    
    [self createModel];
    
    return self;
}

#pragma mark - Model

- (void)createModel {
    NSMutableArray *result = [NSMutableArray new];
    for (NSInteger i = 1; i < 11; ++i) {
        NSString *index = @(i).stringValue;
        Photo *photo = [[Photo alloc]initWithImageNamed:index];
        [result addObject:photo];
    }
    self.data = result;
}

#pragma mark - ViewController Data Source

// this is a public method because the pageViewController calls it to create the first VC
- (ViewController *)createViewControllerAtIndex:(NSInteger)index {
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.photo = self.data[index];
    vc.index = index;
    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger index = ((ViewController *)viewController).index;
    if (index >= self.data.count -1) {
        return nil;
    }
    index += 1;
    ViewController *vc = [self createViewControllerAtIndex:index];
    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSInteger index = ((ViewController *)viewController).index;
    if (index <= 0) {
        return nil;
    }
    index -= 1;
    ViewController *vc = [self createViewControllerAtIndex:index];
    return vc;
}

#pragma mark - Creates PageController (little dots)

// total number of dots
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.data.count;
}

// currently selected VC
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return ((ViewController *)pageViewController.viewControllers[0]).index;
}

@end
