//
//  ZhongDianQiYeViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/6.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "ZhongDianQiYeViewController.h"
#import "ZhongDianQiYeCell.h"
#import "ZhongDianQiYeModel.h"
#import "ZhongDianQiYeDetail.h"
@interface ZhongDianQiYeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *datasource;
@end
static NSString *kZhongDianQiYeCellIdentifier = @"ZhongDianQiYeCellIdentifier";
@implementation ZhongDianQiYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF2F1ED);
    [self initNav];
    [self initMain];
}

-(void)initNav{
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"重点企业";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

-(void)initMain{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 75;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 5, 0);
    self.tableView.backgroundColor = UIColorFromRGB(0xF2F1ED);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[ZhongDianQiYeCell class] forCellReuseIdentifier:kZhongDianQiYeCellIdentifier];
    [self.view addSubview:_tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZhongDianQiYeCell *cell = [tableView dequeueReusableCellWithIdentifier:kZhongDianQiYeCellIdentifier];
    cell.model = self.datasource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZhongDianQiYeDetail *detailController = [[ZhongDianQiYeDetail alloc]init];
    detailController.model = self.datasource[indexPath.row];
    [self.navigationController pushViewController:detailController animated:YES];
    
}

-(NSMutableArray *)datasource{
    if (!_datasource) {
        
        
        _datasource = [[NSMutableArray alloc]init];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"zhongdianqiye" ofType:@"json"];
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSArray *qiye_array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *colors = @[
                            UIColorFromRGB(0xAB94C1),
                            UIColorFromRGB(0xF6D944),
                            UIColorFromRGB(0x56C1CB),
                            UIColorFromRGB(0x95C33C),
                            UIColorFromRGB(0xEE7787)
                            ];
        for(int i = 0; i< qiye_array.count ;i++){
//        for (NSDictionary *qiye_dic in qiye_array) {
            NSDictionary *qiye_dic = qiye_array[i];
            ZhongDianQiYeModel *model = [[ZhongDianQiYeModel alloc]init];
            model.flagColor = colors[i%5];
            model.title = qiye_dic[@"title"];
            model.img = qiye_dic[@"image"];
            model.contentStr = qiye_dic[@"content"];
            [_datasource addObject:model];
        }
      }
    return _datasource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
