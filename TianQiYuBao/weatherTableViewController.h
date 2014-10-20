//
//  weatherTableViewController.h
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDB.h"
#import "sqliteModel.h"
#import "sendMessage.h"

#import "newWeatherViewController.h"
@interface weatherTableViewController : UITableViewController
@property(nonatomic,strong) NSArray *data;
@property(nonatomic,strong)NSMutableArray *muArray;

- (void)loadData;
@end
