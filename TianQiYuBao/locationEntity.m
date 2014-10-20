//
//  locationEntity.m
//  TianQiYuBao
//
//  Created by xionglj on 14-9-4.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "locationEntity.h"

@implementation locationEntity

@synthesize  Data =_Data;
@synthesize Data1 = _Data1;
- (void)getLocation:(NSURL *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if (data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error ];
        
        NSDictionary *dic2 = [dic objectForKey:@"result"];
        NSDictionary *dic3 = [dic2 objectForKey:@"location"];
        
      
        
        locationModel *model = [[locationModel alloc]init];
        model.longitude = [dic3 objectForKey:@"lng"];
        model.latitude = [dic3 objectForKey:@"lat"];
        
        _Data = [[NSMutableArray alloc]init];
        
        [_Data addObject:model];
    }
    
}

/*- (void)getLocation:(NSURL *)url
{
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request1 delegate:self];
    
    if (connection) {
        
        _Data1 = [[NSMutableData alloc]init];
        
        
        
    }
    
}



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_Data1 appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求数据失败");
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"请求完成.....");
    NSError *error;
    
    
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_Data1 options:NSJSONReadingAllowFragments error:&error];
    
    //对字典进行检索，得到最底层的数据
    NSDictionary *dic2 = [dic objectForKey:@"result"];
    NSDictionary *dic3 = [dic2 objectForKey:@"location"];
    
    
    
    locationModel *model = [[locationModel alloc]init];
    model.longitude = [dic3 objectForKey:@"lng"];
    model.latitude = [dic3 objectForKey:@"lat"];
    
    _Data = [[NSMutableArray alloc]init];
    //给数组添加元素model
    [_Data addObject:model];  
    
    NSLog(@"%@==%@",model.longitude,model.latitude);
    
    
    //（数据解析完成后）发送通知
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"hehe2" object:_Data userInfo:nil];
}*/


@end
