//
//  newWeatherViewController.h
//  TianQiYuBao
//
//  Created by xionglj on 14-9-2.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "weatherEntity2.h"
#import "weatherModel2.h"
@interface newWeatherViewController : UIViewController<UIWebViewDelegate>
- (void)mainView;
@property(nonatomic,strong) NSArray *array;

@property(nonatomic,strong)  NSString *str;
@end
