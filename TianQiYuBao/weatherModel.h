//
//  weatherModel.h
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weatherModel : NSObject
@property(nonatomic,strong) NSString *city;
@property(nonatomic,retain) NSString *cityid;
@property(nonatomic,strong) NSString *temp1;
@property(nonatomic,strong) NSString *temp2;
@property(nonatomic,strong) NSString *weather;
@end
