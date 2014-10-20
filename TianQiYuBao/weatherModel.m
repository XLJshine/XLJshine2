//
//  weatherModel.m
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "weatherModel.h"

@implementation weatherModel
@synthesize city,cityid,temp1,temp2,weather;
-(NSString *) description
{
    NSString *result=[NSString stringWithFormat:@"chengshi=%@",city];
    return result;
}
@end
