//
//  TableViewController.m
//  下拉放大
//
//  Created by 生龙 on 15/12/28.
//  Copyright © 2015年 龙. All rights reserved.
//

#import "TableViewController.h"
#import "Pull2Plus.h"
@interface TableViewController ()

@property (nonatomic,strong)Pull2Plus *pullControl;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}


-(void)setupUI{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"road"]];
    
    self.pullControl = [[Pull2Plus alloc] initWith:self.tableView andHeaderView:imageView];
//
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init ]forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = true;
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"tableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"longlago163@163.com (%ld)",indexPath.row];
    return cell;
}


-(void)dealloc{

    NSLog(@"%s",__FUNCTION__);
}

@end
