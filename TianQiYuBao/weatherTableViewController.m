//
//  weatherTableViewController.m
//  TianQiYuBao
//
//  Created by xionglj on 14-8-31.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "weatherTableViewController.h"
#import "weatherViewController2.h"

@implementation weatherTableViewController
{
    UITableViewCell *cell;
    NSString *str;
}
@synthesize data,muArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = item;
    
    
    UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageNamed:@"logo5.png"]];
    [view addSubview:imageView];
    
    
    self.tableView.backgroundView = view;
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(Click)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(Click2)];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(remove)];
    NSArray *array = [NSArray arrayWithObjects:item2,item3,item1, nil];
    self.navigationItem.rightBarButtonItems = array;
    
    [[UserDB shareInstance]createTable];
    
    [self  loadData];

} 
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//删除表格的方法
- (void)remove
{
    
    [self.tableView setTag:UITableViewCellEditingStyleDelete];
    
    BOOL isEditing = self.tableView.isEditing;
    [self.tableView setEditing:!isEditing animated:YES];
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableView.tag;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    //判断表格是否需要删除数据
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UITableViewCell *cell1=[tableView cellForRowAtIndexPath:indexPath];
        str = cell1.textLabel.text;
        
       // NSArray *arr = [[NSArray alloc]initWithObjects:indexPath, nil];
        //更新表格显示
        sqliteModel *model = [[sqliteModel alloc]init];
        [[UserDB shareInstance]subUser:model andTitle:str];
        
        self.data = [[UserDB shareInstance]findWeathers];
        
        //[self.tableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationRight];
        [self.tableView reloadData];
    }

}
- (void)loadData
{
    self.data  = [[UserDB shareInstance]findWeathers];
    [self.tableView reloadData];
}
- (void)Click
{
    weatherViewController2 *wvc2 = [[weatherViewController2 alloc]init];
    [self.navigationController pushViewController:wvc2 animated:YES];
}
- (void)Click2
{
    [[UserDB shareInstance]createTable];
    
    [self  loadData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    sqliteModel *model = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = model.address;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     
    if (indexPath.section == 0) {
        newWeatherViewController *wvc = [[newWeatherViewController alloc]init];
        UITableViewCell *cell1=[tableView cellForRowAtIndexPath:indexPath];
        wvc.str = cell1.textLabel.text;
        [self.navigationController pushViewController:wvc animated:YES];
    }
 
}

@end
