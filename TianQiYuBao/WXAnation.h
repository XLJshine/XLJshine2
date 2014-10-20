//
//  WXAnation.h
//  TianQiYuBao
//
//  Created by xionglj on 14-9-4.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface WXAnation : NSObject<MKAnnotation>
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subtitle;
@property(nonatomic,readonly)CLLocationCoordinate2D coordinate;
- (id)initWithCoordinate2D:(CLLocationCoordinate2D)coodinate;
@end
