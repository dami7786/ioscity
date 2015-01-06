//
//  ZhengCeViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/12/27.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "ZhengCeViewController.h"
#import "TouZiZhiNanCell.h"
#import "TouZiZhiNanSection.h"
#import "TouXiZhiNanCell.h"
#import "CommonWebViewController.h"

static NSString *TouXiZhiNanCellIdentifier = @"TouXiZhiNanCellIdentifier";
static NSString *TouZiZhiNanSectionIdentifier = @"TouZiZhiNanSectionIdentifier";

@interface ZhengCeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation ZhengCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

-(void)commonInit{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.tableView registerClass:[TouZiZhiNanSection class] forHeaderFooterViewReuseIdentifier:TouZiZhiNanSectionIdentifier];
    [self.tableView registerClass:[TouXiZhiNanCell class] forCellReuseIdentifier:TouXiZhiNanCellIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TouXiZhiNanCell *cell = [self.tableView dequeueReusableCellWithIdentifier:TouXiZhiNanCellIdentifier forIndexPath:indexPath];
    TouZiZhiNanSectionModel *sectionModel = self.dataSource[indexPath.section];
    TouXiZhiNanCellModel *cellModel = sectionModel.items[indexPath.row];
    cell.model = cellModel;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    TouZiZhiNanSectionModel *sectionModel = self.dataSource[section];
    return sectionModel.items.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    TouZiZhiNanSection *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:TouZiZhiNanSectionIdentifier];
    TouZiZhiNanSectionModel *sectionModel = self.dataSource[section];
    sectionView.model = sectionModel;
    return sectionView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    CommonWebViewController *webViewController = [[CommonWebViewController alloc]init];
    TouZiZhiNanSectionModel *sectionModel = self.dataSource[indexPath.section];
    TouXiZhiNanCellModel *cellModel = sectionModel.items[indexPath.row];
    webViewController.requestUrl =  cellModel.url;
    [self.navigationController pushViewController:webViewController animated:YES];
}

-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"zhengce" ofType:@"json"];
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSArray *zhengce_array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for (NSDictionary *dic in zhengce_array) {
            TouZiZhiNanSectionModel *sectionModel = [[TouZiZhiNanSectionModel alloc]init];
            sectionModel.title = dic[@"section"];
            NSMutableArray *cellModels = [[NSMutableArray alloc]init];
            NSMutableArray *cellModel_array = dic[@"list"];
            for (NSDictionary *cellDic in cellModel_array) {
                TouXiZhiNanCellModel *cellModel = [[TouXiZhiNanCellModel alloc]init];
                cellModel.title = cellDic[@"title"];
                cellModel.url = cellDic[@"url"];
                [cellModels addObject:cellModel];
            }
            sectionModel.items = cellModels;
            [_dataSource addObject:sectionModel];
        }
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
