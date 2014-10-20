//
//  newWeatherViewController.m
//  TianQiYuBao
//
//  Created by xionglj on 14-9-2.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "newWeatherViewController.h"

@implementation newWeatherViewController
{
    UIImageView *imageView;
    UILabel *label1;
    UILabel *label2;
    UILabel *label3;
    UILabel *label4;
    UILabel *label5;
   
    UIImageView *image1;
    UIImageView *image2;
    UILabel *label22;
    UILabel *label32;
    UILabel *label42;
    UILabel *label52;
    
    UIImageView *image12;
    UIImageView *image22;
    UILabel *label23;
    UILabel *label33;
    UILabel *label43;
    UILabel *label53;
    
    UIImageView *image13;
    UIImageView *image23;
   
    UILabel *label21;
    UILabel *label31;
    UILabel *label41;
    UILabel *label51;
    UIImageView *image11;
    UIImageView *image21;
    
}
@synthesize array,str;
- (void)viewDidLoad
{
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = item;
    

    
    [self mainView];
    
    
    NSString *str1 = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=5LjGPCzarMoLShMPCBUHGVDX",str1]];
    NSLog(@"url=%@",url);
   
    //实例化一个实体对象
    weatherEntity2 *we2 = [[weatherEntity2 alloc]init];
    //使用实体的方法
    [we2 startRequest:url];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sender:) name:@"hehe" object:nil];
    
   
    
}
- (void)mainView
{
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
    [imageView setImage:[UIImage imageNamed:@"logo4.png"]];
    [self.view addSubview:imageView];
    
    label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 100, 50)];
    label1.font = [UIFont systemFontOfSize:20];
    label1.backgroundColor = [UIColor clearColor];
    
    [label1 setTextColor:[UIColor redColor]];
    [self.view addSubview:label1];
    label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 76, 300, 30)];
    label2.backgroundColor = [UIColor clearColor];
    [label2 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label2];
    label3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 116, 100, 30)];
    label3.backgroundColor = [UIColor clearColor];
    [label3 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label3];
    label4 = [[UILabel alloc]initWithFrame:CGRectMake(20,156, 110, 30)];
    label4.backgroundColor = [UIColor clearColor];
    [label4 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label4];
    label5 = [[UILabel alloc]initWithFrame:CGRectMake(120, 116, 100, 30)];
    label5.backgroundColor = [UIColor clearColor];
    [label5 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label5];
    
    image1 = [[UIImageView alloc]initWithFrame:CGRectMake(220,116, 40, 30)];
    image1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image1];
    image2 = [[UIImageView alloc]initWithFrame:CGRectMake(220, 156, 40, 30)];
    image2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image2];
    
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0,203, 320, 1)];
    line.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:line];
    label22 = [[UILabel alloc]initWithFrame:CGRectMake(10, 206, 80, 30)];
    label22.backgroundColor = [UIColor clearColor];
    [label22 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label22];
    label32 = [[UILabel alloc]initWithFrame:CGRectMake(10, 240, 90, 30)];
    label32.backgroundColor = [UIColor clearColor];
    [label32 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label32];
    label42 = [[UILabel alloc]initWithFrame:CGRectMake(100,206, 110, 30)];
    label42.backgroundColor = [UIColor clearColor];
    [label42 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label42];
    label52 = [[UILabel alloc]initWithFrame:CGRectMake(100, 240, 110, 30)];
    label52.backgroundColor = [UIColor clearColor];
    [label52 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label52];
    
    image12 = [[UIImageView alloc]initWithFrame:CGRectMake(220,206, 40, 30)];
    image12.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image12];
    image22 = [[UIImageView alloc]initWithFrame:CGRectMake(220, 240, 40, 30)];
    image22.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image22];
    
    
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0,272, 320, 1)];
    line2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:line2];
    label23 = [[UILabel alloc]initWithFrame:CGRectMake(10, 276, 80, 30)];
    label23.backgroundColor = [UIColor clearColor];
    [label23 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label23];
    label33 = [[UILabel alloc]initWithFrame:CGRectMake(10, 310, 90, 30)];
    label33.backgroundColor = [UIColor clearColor];
    [label33 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label33];
    label43 = [[UILabel alloc]initWithFrame:CGRectMake(100,276, 110, 30)];
    label43.backgroundColor = [UIColor clearColor];
    [label43 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label43];
    label53 = [[UILabel alloc]initWithFrame:CGRectMake(100, 310, 110, 30)];
    label53.backgroundColor = [UIColor clearColor];
    [label53 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label53];
    
    image13 = [[UIImageView alloc]initWithFrame:CGRectMake(220,276, 40, 30)];
    image13.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image13];
    image23 = [[UIImageView alloc]initWithFrame:CGRectMake(220, 310, 40, 30)];
    image23.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image23];
    
    
    UILabel *line3 = [[UILabel alloc]initWithFrame:CGRectMake(0,342, 320, 1)];
    line3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:line3];
    label21 = [[UILabel alloc]initWithFrame:CGRectMake(10, 346, 80, 30)];
    label21.backgroundColor = [UIColor clearColor];
    [label21 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label21];
    label31 = [[UILabel alloc]initWithFrame:CGRectMake(10, 380, 90, 30)];
    label31.backgroundColor = [UIColor clearColor];
    [label31 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label31];
    label41 = [[UILabel alloc]initWithFrame:CGRectMake(100,346, 110, 30)];
    label41.backgroundColor = [UIColor clearColor];
    [label41 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label41];
    label51 = [[UILabel alloc]initWithFrame:CGRectMake(100, 380, 110, 30)];
    label51.backgroundColor = [UIColor clearColor];
    [label51 setTextColor:[UIColor redColor]];
    
    [self.view addSubview:label51];
    
    image11 = [[UIImageView alloc]initWithFrame:CGRectMake(220,346, 40, 30)];
    image11.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image11];
    image21 = [[UIImageView alloc]initWithFrame:CGRectMake(220, 380, 40, 30)];
    image21.backgroundColor = [UIColor clearColor];
    [self.view addSubview:image21];
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sender:(NSNotification *)notification
{
     array = notification.object;
    //实例化模型
    weatherModel2 *wm2 = [[weatherModel2 alloc]init];
    wm2 = [array objectAtIndex:0];
    
    
    
    //将模型属性值附给lable
    label1.text = wm2.cityName;
    label2.text =wm2.date;
    label3.text = wm2.weather;
    label4.text = wm2.wind;
    label5.text = wm2.temperature;
    image1.image = wm2.dayPictureUrl;
    image2.image = wm2.nightPictureUrl;
    
    label22.text =wm2.date1;
    label32.text = wm2.weather1;
    label42.text = wm2.wind1;
    label52.text = wm2.temperature1;
    image12.image = wm2.dayPictureUrl1;
    image22.image = wm2.nightPictureUrl1;
    
    
    label23.text =wm2.date2;
    label33.text = wm2.weather2;
    label43.text = wm2.wind2;
    label53.text = wm2.temperature2;
    image13.image = wm2.dayPictureUrl2;
    image23.image = wm2.nightPictureUrl2;
    
    
    
    label21.text =wm2.date3;
    label31.text = wm2.weather3;
    label41.text = wm2.wind3;
    label51.text = wm2.temperature3;
    image11.image = wm2.dayPictureUrl3;
    image21.image = wm2.nightPictureUrl3;
    
}



@end
