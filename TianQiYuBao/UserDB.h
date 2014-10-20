//
//  UserDB.h
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "BaseDB.h"
#import "sqliteModel.h"
@interface UserDB : BaseDB
+ (id)shareInstance;
//创建用户表
- (void)createTable;
//添加用户
- (BOOL)addUser:(sqliteModel *)weathermodel;
//删除用户
- (BOOL)subUser:(sqliteModel *)usermodel andTitle:(NSString *)title;
//查找用户
- (NSArray *)findWeathers;
@end
