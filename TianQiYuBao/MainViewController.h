//
//  MainViewController.h
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "newWeatherViewController.h"
#import "weatherTableViewController.h"
#import "locationViewController.h"
@interface MainViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
- (void)mainView;
@property(nonatomic,strong)NSArray *data;
@property(nonatomic,strong)NSString *citiName;
@end
