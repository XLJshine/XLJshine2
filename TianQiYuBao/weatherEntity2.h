//
//  weatherEntity2.h
//  TianQiYuBao
//
//  Created by xionglj on 14-9-2.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "weatherModel2.h"
@interface weatherEntity2 : NSObject
@property(nonatomic,strong) NSMutableArray *Data;
@property(nonatomic,strong) NSMutableData *Data1;
- (void)startRequest:(NSURL *)url;
//-(NSData*) getImage:(NSString*) url;
-(UIImage *)getImage:(NSString *)url;

@end
