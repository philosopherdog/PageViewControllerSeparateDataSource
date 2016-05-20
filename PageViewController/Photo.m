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

- (instancetype)init {
    NSAssert(NO, @"Call the designated initializer");
    return [self initWithImageNamed:nil];
}


@end
