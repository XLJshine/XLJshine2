//
//  MainViewController.m
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
@implementation MainViewController

@synthesize data,citiName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"天气预报";
    }
    return self;
}

- (void)Click
{
    newWeatherViewController *wvc = [[newWeatherViewController alloc]init];
    wvc.str = self.citiName;
    [self.navigationController pushViewController:wvc animated:YES];
}
- (void)Click1
{
    locationViewController *lvc = [[locationViewController alloc]init];
    lvc.str = self.citiName;
    [self.navigationController pushViewController:lvc animated:YES];
}
- (void)Click2
{
    weatherTableViewController *wvc = [[weatherTableViewController alloc]init];
    [self.navigationController pushViewController:wvc animated:YES];
}
- (void)viewDidLoad
 {
    [super viewDidLoad];
     
     [self mainView];
    
     
     //取得plist文件的数据
     NSString *path = [[NSBundle mainBundle]pathForResource:@"allCity" ofType:@"plist"];//路径
     NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];               //取到文件
     data = [dic objectForKey:@"Root"];    //取Root目录下的文件
     
     
     
     
 }
- (void)mainView
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageNamed:@"logo1.png"]];
    [self.view addSubview:imageView];
    //实例化一个pickerView
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(10, 100, 300, 150)];
    
    //pickerView数据源与代理
    pickerView.delegate = self;
    pickerView.dataSource = self;
    //选中栏是否显示
    pickerView.showsSelectionIndicator = YES;
    [self.view addSubview:pickerView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(30, 320, 70, 30);
    [btn setTitle:@"天气查询" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(125, 320, 70, 30);
    [btn1 setTitle:@"地理查询" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(Click1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(220, 320,70, 30);
    [btn2 setTitle:@"我的城市" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(Click2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 280, 30)];
    label.text = @"请选择你要查询的城市，点击查询";
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    
    label.textColor = [UIColor redColor];
    
    [self.view addSubview:label];
}
 
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
         return data.count;
    }
    //返回第一列选择的行的索引
    NSInteger selectedrow = [pickerView selectedRowInComponent:0];
    //取得省级字典
    NSDictionary *dic = [data objectAtIndex:selectedrow];
    //取得字典中的城市
    NSArray *arr = [dic objectForKey:@"cities"];
    return arr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        NSDictionary *dic = [data objectAtIndex:row];
        NSString *state = [dic objectForKey:@"state"];
        return state;
    }
    else{
      //返回第一列选择的行的索引
        NSInteger selectedrow = [pickerView selectedRowInComponent:0];
        //取得省级字典
        NSDictionary *dic = [data objectAtIndex:selectedrow];
        NSArray *arr = [dic objectForKey:@"cities"];
        citiName = [arr objectAtIndex:row];
        return citiName;
    }
 
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        //刷新列中的行
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        
    }
    else{
        //返回第一列选择的行的索引
        NSInteger selectedrow = [pickerView selectedRowInComponent:0];
        //取得省级字典
        NSDictionary *dic = [data objectAtIndex:selectedrow];
        NSArray *arr = [dic objectForKey:@"cities"];
        citiName = [arr objectAtIndex:row];
      }

}

@end
