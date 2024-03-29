//
//  ViewController.m
//  RunLoop
//
//  Created by Charles on 2019/9/4.
//  Copyright © 2019 Charles. All rights reserved.
//

#import "ViewController.h"
#import "TimerOneViewController.h"
#import "TimerTwoViewController.h"
#import "PerformSelectorViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.dataArray = @[@"NSTimer在主线程使用", @"NSTimer在子线程使用", @"Perform Selector的使用"];
    
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        TimerOneViewController *timerOne = [[TimerOneViewController alloc] init];
        [self.navigationController pushViewController:timerOne animated:YES];
    }
    if(indexPath.row == 1) {
        TimerTwoViewController *timeTwo = [[TimerTwoViewController alloc] init];
        [self.navigationController pushViewController:timeTwo animated:YES];
    }
    if(indexPath.row == 2) {
        PerformSelectorViewController *perfromSelector = [[PerformSelectorViewController alloc] init];
        [self.navigationController pushViewController:perfromSelector animated:YES];
    }
}

#pragma mark - Property

- (UITableView *)tableView {
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
