//
//  weatherEntity.m
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "weatherEntity.h"
#import "weatherModel.h"
@implementation weatherEntity
@synthesize listData = _listData;
@synthesize  Data =_Data;
- (void)startRequest:(NSURL *)url
{
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];

    
    NSError *error;
    NSData *DataSource = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if(error)
    {
        NSLog(@"error=%@",error);
    }
    if (DataSource) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:DataSource options:NSJSONReadingAllowFragments error:nil];
        
        _listData = [dic objectForKey:@"weatherinfo"];
        
        _Data = [[NSMutableArray alloc]init];
        /* [_listData enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop){
         NSDictionary *tempDic = obj;
         model *newModel = [[model alloc]init];
         newModel.name = [tempDic objectForKey:@"name"];
         newModel.image = [tempDic objectForKey:@"img"];
         
         [_Data addObject:newModel]; 
         
         
         
         }];*/
        
          
        weatherModel *newModel = [[weatherModel alloc]init];
            
            newModel.city = [_listData objectForKey:@"city"];
            newModel.cityid = [_listData objectForKey:@"cityid"];
            newModel.temp1 = [_listData objectForKey:@"temp1"];
            newModel.temp2 = [_listData objectForKey:@"temp2"];
            newModel.weather = [_listData objectForKey:@"weather"];
          NSLog(@"city=%@",newModel.city);
            [_Data addObject:newModel];
       
        
    }
}
@end
