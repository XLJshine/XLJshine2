//
//  weatherViewController2.m
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "weatherViewController2.h"

@implementation weatherViewController2
{
    UITextField *field1;
    UITextField *field2;
}


 - (void)viewDidLoad
 {
    [super viewDidLoad];
     
     
     UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
     self.navigationItem.leftBarButtonItem = item1;
     
     
     UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
     [imageView setImage:[UIImage imageNamed:@"logo3.png"]];
     [self.view addSubview:imageView];
     
     UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(Click)];
     self.navigationItem.rightBarButtonItem = item;
     
     UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 300, 90)];
     lable.text = @" 请在地址栏中输入长期需要查询的地址，并点击右上角Sure按钮保存城市";
     lable.textColor = [UIColor redColor];
     lable.backgroundColor = [UIColor clearColor];
     lable.font = [UIFont systemFontOfSize:20];
     lable.numberOfLines = 3;
     [self.view addSubview:lable];
     
     
     UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 80, 30)];
     label1.backgroundColor = [UIColor clearColor];
     label1.text = @"城市名：";
     [self.view addSubview:label1];
  
     field1 = [[UITextField alloc]initWithFrame:CGRectMake(110, 120, 150, 30)];
     field1.delegate = self;
     field1.borderStyle = UITextBorderStyleLine;
     
     [self.view addSubview:field1];

 }
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)Click
{
    NSString *address = field1.text;
   
    
    sqliteModel *model = [[sqliteModel alloc]init];
    model.address = address;
    
    
    
    //将model加入数据库
    [[UserDB shareInstance]addUser:model];
    [self.navigationController popViewControllerAnimated:YES];
     
    
 
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



@end
