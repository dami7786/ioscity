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
    titleLabel.font = [UIFont systemFontOfSize:18];
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
        
        
//        ZhongDianQiYeModel *model1 = [[ZhongDianQiYeModel alloc]init];
//        model1.flagColor = UIColorFromRGB(0xAB94C1);
//        model1.title = @"西安中兴精诚通讯有限公司";
//        model1.img = @"";
//        model1.content = @"";
//        
//        ZhongDianQiYeModel *model2 = [[ZhongDianQiYeModel alloc]init];
//        model2.flagColor = UIColorFromRGB(0xF6D944);
//        model2.title = @"西安优势铁路新技术有限责任公司";
//        model2.img = @"";
//        
//        ZhongDianQiYeModel *model3 = [[ZhongDianQiYeModel alloc]init];
//        model3.flagColor = UIColorFromRGB(0x56C1CB);
//        model3.title = @"西安优势物联网科技有限公司";
//        model3.img = @"";
//        
//        ZhongDianQiYeModel *model4 = [[ZhongDianQiYeModel alloc]init];
//        model4.flagColor = UIColorFromRGB(0x95C33C);
//        model4.title = @"西安伊洋电子科技有限公司";
//        model4.img = @"";
//        
//        ZhongDianQiYeModel *model5 = [[ZhongDianQiYeModel alloc]init];
//        model5.flagColor = UIColorFromRGB(0xEE7787);
//        model5.title = @"西安磁林电气有限公司";
//        model5.img = @"";
//        
//        ZhongDianQiYeModel *model6 = [[ZhongDianQiYeModel alloc]init];
//        model6.flagColor = UIColorFromRGB(0xAB94C1);
//        model6.title = @"西安和丰诚信息科技有限公司";
//        model6.img = @"";
//        
//        
//        ZhongDianQiYeModel *model7 = [[ZhongDianQiYeModel alloc]init];
//        model7.flagColor = UIColorFromRGB(0xF6D944);
//        model7.title = @"西安新通药物研究有限公司";
//        model7.img = @"";
//        
//        
//        ZhongDianQiYeModel *model8 = [[ZhongDianQiYeModel alloc]init];
//        model8.flagColor = UIColorFromRGB(0x56C1CB);
//        model8.title = @"深圳市华芯邦科技有限公司";
//        model8.img = @"";
//        
//        
//        ZhongDianQiYeModel *model9 = [[ZhongDianQiYeModel alloc]init];
//        model9.flagColor = UIColorFromRGB(0x95C33C);
//        model9.title = @"陕西亚成微电子股份有限公司";
//        model9.img = @"";
//        
//        
//        ZhongDianQiYeModel *model10 = [[ZhongDianQiYeModel alloc]init];
//        model10.flagColor = UIColorFromRGB(0xEE7787);
//        model10.title = @"陕西三联果业集团有限责任公司";
//        model10.img = @"";
//        
//        _datasource = [@[model1,model2,model3,model4,model5,model6,model7,model8,model9,model10]mutableCopy];
    }
    return _datasource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
