//
//  locationViewController.h
//  TianQiYuBao
//
//  Created by xionglj on 14-9-4.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "locationEntity.h"
#import "locationModel.h"
#import "WXAnation.h"
#import "weatherModel2.h"
#import "weatherEntity2.h"
@interface locationViewController : UIViewController<MKMapViewDelegate> {
    MKMapView *mapView;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong)NSString *str;
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,strong)NSArray *array1;

@end
