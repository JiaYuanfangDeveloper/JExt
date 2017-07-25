//
//  ViewController.m
//  JExt
//
//  Created by Mr_Jia on 2017/7/21.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

#import "ViewController.h"
#import "UIColorExt.h"
#import "UIDeviceExt.h"
#import "UICopyLabel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *sectionTableView;
@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) NSMutableArray *flagArray;

@end

@implementation ViewController

- (UITableView *)sectionTableView {
    if (!_sectionTableView) {
        _sectionTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
        _sectionTableView.dataSource = self;
        _sectionTableView.delegate = self;
    }
    return _sectionTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];


//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 100, 30);
//    [btn setTitle:@"randomColor" forState:UIControlStateNormal];
//    [btn sizeToFit];
//    btn.layer.cornerRadius = 5;
//    btn.backgroundColor = [UIColor ang_randomColor];
////    btn.backgroundColor = [UIColor gradientFromColor:[UIColor grayColor] endColor:[UIColor redColor] withHeight:10];
//    [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//    
    [self makeData];
//    [self.view addSubview:self.sectionTableView];
    
    UICopyLabel *label = [[UICopyLabel alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    
    label.text = @"jiayuanfang";
    [self.view addSubview:label];
}

- (void)makeData {
    _sectionArray = [NSMutableArray array];
    _flagArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 8; i++) {
        NSMutableArray *rowArray = [NSMutableArray array];
        for (NSInteger j = 0; j < arc4random()%20+1; j++) {
            [rowArray addObject:@(j)];
        }
        [_sectionArray addObject:rowArray];
        [_flagArray addObject:@"NO"];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *arr = _sectionArray[section];
    return arr.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    label.text = [NSString stringWithFormat:@"第%ld组",section];
    label.backgroundColor = [UIColor yellowColor];
    label.tag = section + 100;
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick:)];
    [label addGestureRecognizer:tap];
    return label;
}
- (void)labelClick:(UITapGestureRecognizer *)tap {
    
    NSInteger section = tap.view.tag % 100;
    NSMutableArray *indexPathArray = [NSMutableArray array];
    NSArray *arr = self.sectionArray[section];
    for (NSInteger i = 0; i < arr.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPathArray addObject:indexPath];
    }
    if ([_flagArray[section] isEqualToString:@"YES"]) {
        _flagArray[section] = @"NO";
//        [self.sectionTableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationTop]; //使用下面注释的方法就 注释掉这一句

    }else {
        _flagArray[section] = @"YES";
//        [self.sectionTableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationBottom];  //使用下面注释的方法就 注释掉这一句

    }
    
    NSRange range = NSMakeRange(section, 1);
    NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    [self.sectionTableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];

    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组，第%ld个Cell",indexPath.section,indexPath.row];
    cell.clipsToBounds = YES;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([_flagArray[indexPath.section] isEqualToString:@"YES"]) {
        return 44;
    }else {
        return 0;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (void)clickAction:(UIButton *)sender {
    self.view.backgroundColor = [UIColor ang_randomColor];
    
//    self.view.backgroundColor = [UIColor gradientFromColor:[UIColor yellowColor] endColor:[UIColor purpleColor] withHeight:100];
    
    NSLog(@"%@",[UIDevice ang_platform]);
    NSLog(@"%@",[UIDevice ang_platformString]);
    NSLog(@"%@",[UIDevice ang_macAddress]);
    NSLog(@"%ld",[UIDevice ang_cpuFrequency]);
    NSLog(@"%ld",[UIDevice ang_busFrequency]);
    NSLog(@"%ld",[UIDevice ang_cpuNumber]);
    NSLog(@"%@",[UIDevice ang_systemVersion]);
    NSLog(@"%d",[UIDevice ang_hasCamera]);
    NSLog(@"%ld",[UIDevice ang_totalMemoryBytes]);
    NSLog(@"%ld",[UIDevice ang_freeMemoryBytes]);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
