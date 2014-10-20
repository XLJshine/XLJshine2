//
//  WXAnation.m
//  TianQiYuBao
//
//  Created by xionglj on 14-9-4.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "WXAnation.h"

@implementation WXAnation
@synthesize coordinate = _coordinate;
@synthesize title,subtitle;
- (id)initWithCoordinate2D:(CLLocationCoordinate2D)coodinate
{
    self = [super init];
    if (self != nil) {
        _coordinate = coodinate;
    }
    return self;
}
@end
