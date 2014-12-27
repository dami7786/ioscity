//
//  TouZiZhiNanViewController.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/6.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "TouZiZhiNanViewController.h"
#import "TouZiZhiNanCell.h"
#import "TouZiZhiNanSectionView.h"
#import "TouZiZhiNanDecorationView.h"
#import "MZBookShelfCollectionViewLayout.h"
static NSString * kTouZiZhiNanCellIdentifier = @"TouZiZhiNanCellIdentifier";

@interface TouZiZhiNanViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation TouZiZhiNanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavBar];
    [self initMain];
}

//设置导航栏
- (void)initNavBar {
    
    //左侧按钮
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [addButton addTarget:self  action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [addButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:addButton];
    [self.navigationItem setRightBarButtonItem:leftButton animated:NO];
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"投资指南";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = RGB(66, 66, 66);
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}
-(void)initMain{
    MZBookshelfCollectionViewLayout *flowLayout = [[MZBookshelfCollectionViewLayout alloc]init];
    [flowLayout registerClass:[TouZiZhiNanDecorationView class] forDecorationViewOfKind:MZBookshelfCollectionViewLayoutDecorationViewKind];
    flowLayout.itemSize = CGSizeMake(98, 127);
    flowLayout.minimumLineSpacing = 40;
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];//UIColorFromRGB(0xF2F1ED);
    [self.collectionView registerClass:[TouZiZhiNanCell class] forCellWithReuseIdentifier:kTouZiZhiNanCellIdentifier];
    [self.collectionView registerClass:[TouZiZhiNanSectionView class]  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TouZiZhiNanSectionView"];
    [self.view addSubview:_collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark - Actions

-(void)addButtonClicked:(UIButton *)sender{
    
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TouZiZhiNanCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTouZiZhiNanCellIdentifier forIndexPath:indexPath];
    cell.imageName = self.dataSource[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController = [[UIViewController alloc]init];
//    viewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    viewController.view.backgroundColor = [UIColor whiteColor];
//    [self presentViewController:viewController animated:YES completion:^{
//        
//    }];
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5,0, 5);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout referenceSizeForDecorationViewForRow:(NSInteger)row inSection:(NSInteger)section{
    
    return CGSizeMake(collectionViewLayout.collectionViewContentSize.width, 60);
}

- (UIOffset)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout decorationViewAdjustmentForRow:(NSInteger)row inSection:(NSInteger)section{

    return UIOffsetMake(0, -15);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 40);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    TouZiZhiNanSectionView *sectionView =     [collectionView dequeueReusableSupplementaryViewOfKind:kind   withReuseIdentifier:@"TouZiZhiNanSectionView" forIndexPath:indexPath];
    return sectionView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(98, 127);
}

#pragma mark - Images

-(NSArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = @[@"fm_fuhuaqichengce",@"fm_jinrongfuwu",@"fm_ruyuanliucheng",@"fm_zhengfuzijishenqing",@"fm_hangyefazhandongtai"];
    }
    return _dataSource;
}

@end
