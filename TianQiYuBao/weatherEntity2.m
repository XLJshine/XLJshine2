//
//  weatherEntity2.m
//  TianQiYuBao
//
//  Created by xionglj on 14-9-2.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "weatherEntity2.h"
#import "ASIHTTPRequest.h"
@implementation weatherEntity2
{
    ASIHTTPRequest *request;
}
@synthesize  Data =_Data;
@synthesize Data1 = _Data1;

/*- (void)startRequest:(NSURL *)url
{
   //URL请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    NSError *error;
    //发送同步请求，并得到数据
    NSData *dataSource = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error ];
    
    if (error) {
        NSLog(@"error = %@",error);
    }
    if (dataSource) {
        //对请求得到的数据进行json解析并存入字典dic
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataSource options:NSJSONReadingAllowFragments error:nil];
        //对字典进行检索，得到最底层的数据
        NSArray *arr = [dic objectForKey:@"results"];
        NSLog(@"arr = %@",arr);
        NSDictionary *dic2 = [arr objectAtIndex:0];
        
        NSString *cityName = [dic2 objectForKey:@"currentCity"];
        NSArray *arr2 = [dic2 objectForKey:@"weather_data"];
        
        NSDictionary *dic3 = [arr2 objectAtIndex:0];
        NSDictionary *dic4 = [arr2 objectAtIndex:1];
        NSDictionary *dic5 = [arr2 objectAtIndex:2];
        NSDictionary *dic6 = [arr2 objectAtIndex:3];
       
        //初始化模型实例
        weatherModel2 *model = [[weatherModel2 alloc]init];
        
        //将检索出来的底层数据副给模型的各个属性
        model.cityName = cityName;
        
        
        model.date = [dic3 objectForKey:@"date"];
        model.dayPictureUrl = [UIImage imageWithData:[self getImage:[dic3 objectForKey:@"dayPictureUrl"]]];
        model.nightPictureUrl = [UIImage imageWithData:[self getImage:[dic3 objectForKey:@"nightPictureUrl"]]];
        model.weather = [dic3 objectForKey:@"weather"];
        model.wind = [dic3 objectForKey:@"wind"];
        model.temperature = [dic3 objectForKey:@"temperature"];
       
        model.date1 = [dic4 objectForKey:@"date"];
        model.dayPictureUrl1 = [UIImage imageWithData:[self getImage:[dic4 objectForKey:@"dayPictureUrl"]]];
        model.nightPictureUrl1 = [UIImage imageWithData:[self getImage:[dic4 objectForKey:@"nightPictureUrl"]]];
        model.weather1 = [dic4 objectForKey:@"weather"];
        model.wind1 = [dic4 objectForKey:@"wind"];
        model.temperature1 = [dic4 objectForKey:@"temperature"];
        
        model.date2 = [dic5 objectForKey:@"date"];
        model.dayPictureUrl2 = [UIImage imageWithData:[self getImage:[dic5 objectForKey:@"dayPictureUrl"]]];
        model.nightPictureUrl2 = [UIImage imageWithData:[self getImage:[dic5 objectForKey:@"nightPictureUrl"]]];
        model.weather2 = [dic5 objectForKey:@"weather"];
        model.wind2 = [dic5 objectForKey:@"wind"];
        model.temperature2 = [dic5 objectForKey:@"temperature"];
        
        model.date3 = [dic6 objectForKey:@"date"];
        model.dayPictureUrl3 = [UIImage imageWithData:[self getImage:[dic6 objectForKey:@"dayPictureUrl"]]];
        model.nightPictureUrl3 = [UIImage imageWithData:[self getImage:[dic6 objectForKey:@"nightPictureUrl"]]];
        model.weather3 = [dic6 objectForKey:@"weather"];
        model.wind3 = [dic6 objectForKey:@"wind"];
        model.temperature3 = [dic6 objectForKey:@"temperature"];
        
        _Data = [[NSMutableArray alloc]init];
        //给数组添加元素model
        [_Data addObject:model];
        
    }
    
    
}

//通过ASIHTTPRequest请求网络得到图片，自定义方法
-(NSData*) getImage:(NSString*) url
{
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
       
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:30];
    
    [request startSynchronous];
    if(request.error)
    {
        NSLog(@"请求出错");
        return nil;
    }
    
    return request.responseData;
}*/

- (void)startRequest:(NSURL *)url
{
    NSURLRequest *request1 = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request1 delegate:self];
    
    if (connection) {
        
        _Data1 = [[NSMutableData alloc]init];
        
        
        
    }
    
}

//使用ASI第三方类库，获取图片
- (UIImage *)getImage:(NSString *)url
{
    request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:30];
    
    
    
    
    //设置缓存
   /* NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    cache = [[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePath];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
    
    request.cacheStoragePolicy = ASICachePermanentlyCacheStoragePolicy;
    request.downloadCache = cache;*/
    
    [request startSynchronous];
    if(request.error)
    {
        NSLog(@"请求出错");
        return nil;
    }
    UIImage *image = [[UIImage alloc]init];
    image = [UIImage imageWithData:request.responseData];
    
    return image;
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
    NSArray *arr = [dic objectForKey:@"results"];
    NSLog(@"arr = %@",arr);
    NSDictionary *dic2 = [arr objectAtIndex:0];
    
    NSString *cityName = [dic2 objectForKey:@"currentCity"];
    NSArray *arr2 = [dic2 objectForKey:@"weather_data"];
    
    NSDictionary *dic3 = [arr2 objectAtIndex:0];
    NSDictionary *dic4 = [arr2 objectAtIndex:1];
    NSDictionary *dic5 = [arr2 objectAtIndex:2];
    NSDictionary *dic6 = [arr2 objectAtIndex:3];
    
    //初始化模型实例
    weatherModel2 *model = [[weatherModel2 alloc]init];
    
    //将检索出来的底层数据副给模型的各个属性
    model.cityName = cityName;
    
    
    model.date = [dic3 objectForKey:@"date"];
    model.dayPictureUrl = [self getImage:[dic3 objectForKey:@"dayPictureUrl"]];
    model.nightPictureUrl = [self getImage:[dic3 objectForKey:@"nightPictureUrl"]];
    model.weather = [dic3 objectForKey:@"weather"];
    model.wind = [dic3 objectForKey:@"wind"];
    model.temperature = [dic3 objectForKey:@"temperature"];
    
    model.date1 = [dic4 objectForKey:@"date"];
    model.dayPictureUrl1 = [self getImage:[dic4 objectForKey:@"dayPictureUrl"]];
    model.nightPictureUrl1 = [self getImage:[dic4 objectForKey:@"nightPictureUrl"]];
    model.weather1 = [dic4 objectForKey:@"weather"];
    model.wind1 = [dic4 objectForKey:@"wind"];
    model.temperature1 = [dic4 objectForKey:@"temperature"];
    
    model.date2 = [dic5 objectForKey:@"date"];
    model.dayPictureUrl2 = [self getImage:[dic5 objectForKey:@"dayPictureUrl"]];
    model.nightPictureUrl2 = [self getImage:[dic5 objectForKey:@"nightPictureUrl"]];
    model.weather2 = [dic5 objectForKey:@"weather"];
    model.wind2 = [dic5 objectForKey:@"wind"];
    model.temperature2 = [dic5 objectForKey:@"temperature"];
    
    model.date3 = [dic6 objectForKey:@"date"];
    model.dayPictureUrl3 = [self getImage:[dic6 objectForKey:@"dayPictureUrl"]];
    model.nightPictureUrl3 = [self getImage:[dic6 objectForKey:@"nightPictureUrl"]];
    model.weather3 = [dic6 objectForKey:@"weather"];
    model.wind3 = [dic6 objectForKey:@"wind"];
    model.temperature3 = [dic6 objectForKey:@"temperature"];
    
    _Data = [[NSMutableArray alloc]init];
    //给数组添加元素model
    [_Data addObject:model];  
        
    
    //（数据解析完成后）发送通知
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"hehe" object:_Data userInfo:nil];
}



@end
