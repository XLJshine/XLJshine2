//
//  locationEntity.h
//  TianQiYuBao
//
//  Created by xionglj on 14-9-4.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "locationModel.h"
@interface locationEntity : NSObject
@property(nonatomic,strong) NSMutableArray *Data;
@property(nonatomic,strong) NSMutableData *Data1;
- (void)getLocation:(NSURL *)url;
@end
