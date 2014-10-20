//
//  UserDB.m
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "UserDB.h"

static UserDB *instance;

@implementation UserDB


/*外界初始化得到单例类对象的唯一接口，这个类方法返回的就是instance，即类的一个对象，
 如果instance为空，则实例化一个对象，如果不为空，则直接返回。这样保证了实例的唯一*/
+ (id)shareInstance
{
    if (instance == nil) {
        instance = [[[self class]alloc]init];
    }
    return instance;
}
- (void)createTable
{
    NSString *sql = @"CREATE TABLE IF NOT EXISTS User (address TEXT primary key)";
    [self createTable:sql];
}
//添加用户
- (BOOL)addUser:(sqliteModel *)weathermodel
{
    NSString *sql = @"INSERT INTO User(address) VALUES (?)";
    NSArray *params = [NSArray arrayWithObjects:weathermodel.address,
                       
                        nil];
    return  [self dealData:sql paramsarray:params];
}
//删除用户
- (BOOL)subUser:(sqliteModel *)usermodel andTitle:(NSString *)title
{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM User WHERE address = '%@'",title];
    NSLog(@"sql ===========%@",sql);
    
    return  [self dealData:sql paramsarray:nil];
}
//查询用户
- (NSArray *)findWeathers
{
    NSString *sql = @"SELECT * FROM User";
    NSArray *data  =    [self selectData:sql columns:1];
    
    //要查找的用户集合
    NSMutableArray *weathers = [NSMutableArray array];
    
    for (NSArray *row in data) {
        NSString *address =  [row objectAtIndex:0];
        
        
        
        sqliteModel *weather = [[sqliteModel alloc]init];
        weather.address = address;
        
        
        
        [weathers addObject:weather];
        
        
    }
    return weathers;
}
@end
