//
//  APStudent.m
//  Lesson 8 HW 2
//
//  Created by Alex on 16.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APStudent.h"

@implementation APStudent

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@ is here, %@", self.name, self.lastName, self.hello];
}

@end
