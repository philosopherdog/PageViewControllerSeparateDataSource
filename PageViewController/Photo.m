//
//  Photo.m
//  PageViewController
//
//  Created by steve on 2016-05-20.
//  Copyright © 2016 steve. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImageNamed:(NSString *)name {
    if (![super init]) {return  nil;}
    _image = [UIImage imageNamed:name];
    return self;
}

// I need to override init and call the designated initializer
// Here I'm crashing if someone calls init, because there's no point in creating a Photo object without an image.
- (instancetype)init {
    NSAssert(NO, @"Call the designated initializer");
    return [self initWithImageNamed:nil];
}


@end
