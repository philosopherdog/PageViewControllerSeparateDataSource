//
//  Photo.h
//  PageViewController
//
//  Created by steve on 2016-05-20.
//  Copyright © 2016 steve. All rights reserved.
//

@import UIKit;

@interface Photo : NSObject
- (instancetype)initWithImageNamed:(NSString *)name NS_DESIGNATED_INITIALIZER;
@property (nonatomic) UIImage *image;
@end
