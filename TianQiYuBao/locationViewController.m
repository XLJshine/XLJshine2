//
//  locationViewController.m
//  TianQiYuBao
//
//  Created by xionglj on 14-9-4.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "locationViewController.h"

@implementation locationViewController
{
    weatherModel2 *wm2;
    NSString *str1;
    WXAnation *anation;
    
}
@synthesize mapView;
@synthesize str,array,array1;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = item;

    /*
     *地理位置请求
     */
    str1 = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.map.baidu.com/geocoder?address=%@&output=json&key=E871ad6c4d6c1cd029c421d2fb3f36c3",str1]];
    locationEntity *le = [[locationEntity alloc]init];
    [le getLocation:url];
    array = le.Data;
    
    locationModel *lm = [[locationModel alloc]init];
    
    lm = [array objectAtIndex:0];
    
    //self.mapView.showsUserLocation = YES; //显示用户当前位置
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    //将数字字符串转成浮点数字
    float longitude,latitude;
    longitude = [lm.longitude floatValue];
    latitude = [lm.latitude floatValue];
    
    //地图初始显示范围
    CLLocationCoordinate2D coord = {latitude,longitude};
    MKCoordinateSpan span = {1,1};
    MKCoordinateRegion region = {coord,span};
    [self.mapView setRegion:region];
    
   
    /*
     *天气请求
     */
    
    NSURL *url2 = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=5LjGPCzarMoLShMPCBUHGVDX",str1]];
    NSLog(@"url=%@",url2);
    
    //实例化一个实体对象
    weatherEntity2 *we2 = [[weatherEntity2 alloc]init];
    //使用实体的方法
    [we2 startRequest:url2];
    
    
    //self.mapView.showsUserLocation = YES; //显示用户当前位置
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    CLLocationCoordinate2D showCoord = {latitude,longitude};
    //标注
    anation = [[WXAnation alloc]initWithCoordinate2D:showCoord];
    //anation.title =[NSString stringWithFormat:@"%@   %@ %@ %@",str,wm2.weather,wm2.wind,wm2.temperature];
    anation.subtitle = [NSString stringWithFormat:@"经度:%@ 纬度:%@",lm.longitude,lm.latitude];
    
    [self.mapView addAnnotation:anation];
     
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sender:) name:@"hehe" object:nil];
 
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sender:(NSNotification *)notification
{
    array = notification.object;
    //实例化模型
    wm2 = [[weatherModel2 alloc]init];
    wm2 = [array objectAtIndex:0];
    anation.title = [NSString stringWithFormat:@"%@   %@ %@ %@",str,wm2.weather,wm2.wind,wm2.temperature];
   
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
   /* //判断是否为当前设备位置的annotation
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        //返回nil，使用默认的标注视图，（蓝色小球）
        return nil;
    }*/
    
    
    static NSString *identifier = @"Annotation";
    //MKPinAnnotationView 是大头针视图  
    //复用标注视图
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
        //是否显示标题视图
        annotationView.canShowCallout = YES;
        
        /*UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [btn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        //标题右边视图
        annotationView.rightCalloutAccessoryView = btn;*/
        
    }
    //设置大头针的颜色
    annotationView.pinColor = MKPinAnnotationColorRed;
    //大头针从天上掉落
    annotationView.animatesDrop = YES;
    
    return annotationView;
    
    
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
