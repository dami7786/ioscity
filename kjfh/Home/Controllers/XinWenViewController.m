//
//  XinWenViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/6.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "XinWenViewController.h"
#import "NewsCell.h"
#import "NewsDetailViewController.h"
@interface XinWenViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation XinWenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xF2F1ED);
    [self initNavBar];
    [self initMain];
    [self loadDatasource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置导航栏
- (void)initNavBar {
    
    //左侧按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [btn addTarget:self  action:@selector(favButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"fav_article"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:leftButton animated:NO];
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"新闻";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}
-(void)initMain{
    _tableView = [[UITableView alloc]initWithFrame:self.navigationController.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
     self.tableView.backgroundColor = UIColorFromRGB(0xF2F1ED);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top);
        make.bottom.equalTo(self.view.bottom);
        make.width.equalTo(self.view.width);
    }];
}

-(void)loadDatasource{
    
  NSString *newsListFilePath = [[NSBundle mainBundle] pathForResource:@"newsList" ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:newsListFilePath];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *array  = [[NSArray alloc]initWithArray:dic[@"newsList"]];
    _dataSource = [[NSMutableArray alloc]init];
    for (NSDictionary *newsDic in array) {
        NewsModel *model = [[NewsModel alloc]init];
        model.title = newsDic[@"title"];
        model.link = newsDic[@"link"];
        model.hot = [newsDic[@"hot"]boolValue];
        model.img = newsDic[@"img"];
        [_dataSource addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate  UITableViewDataSourece
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"CellIdentifier";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.model = self.dataSource[indexPath.row];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return NewsCellDefualtHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModel *model = self.dataSource[indexPath.row];
    NewsDetailViewController *newsDetail = [[NewsDetailViewController alloc]init];
    newsDetail.newsUrl = model.link;
    [self.navigationController pushViewController:newsDetail animated:YES];
}

-(void)favButtonClicked:(UIButton *)sender{
    
}
@end
