//
//  weatherEntity.h
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weatherEntity : NSObject
@property(nonatomic,strong) NSDictionary *listData;
@property(nonatomic,strong) NSMutableArray *Data;
- (void)startRequest:(NSURL *)url;
@end
