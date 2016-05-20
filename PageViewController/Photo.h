//
//  Photo.h
//  PageViewController
//
//  Created by steve on 2016-05-20.
//  Copyright © 2016 steve. All rights reserved.
//

@import UIKit;

@interface Photo : NSObject
// I'm explicitly declaring this custom init as the designated initializer
- (instancetype)initWithImageNamed:(NSString *)name NS_DESIGNATED_INITIALIZER;
@property (nonatomic) UIImage *image;
@end
