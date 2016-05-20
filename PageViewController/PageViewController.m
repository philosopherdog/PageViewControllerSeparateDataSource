//
//  PageViewController.m
//  PageViewController
//
//  Created by steve on 2016-05-20.
//  Copyright © 2016 steve. All rights reserved.
//

#import "PageViewController.h"
#import "Photo.h"
#import "ViewController.h"

@interface PageViewController ()<UIPageViewControllerDataSource>
@property (nonatomic) NSArray<Photo*>*data;
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
    [self createModel];
    ViewController *vc = [self createViewControllerAtIndex:0];
    [self setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

- (ViewController *)createViewControllerAtIndex:(NSInteger)index {
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    vc.photo = self.data[index];
    vc.index = index;
    return vc;
}

- (void)createModel {
    NSMutableArray *result = [NSMutableArray new];
    for (NSInteger i = 1; i < 11; ++i) {
        NSString *index = @(i).stringValue;
        Photo *photo = [[Photo alloc]initWithImageNamed:index];
        [result addObject:photo];
    }
    self.data = result;
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

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.data.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return ((ViewController *)pageViewController.viewControllers[0]).index;
}


@end
