//
//  TouZiZhiNanLayout.m
//  kjfh
//
//  Created by ZhangAimin on 14/10/7.
//  Copyright (c) 2014年 自由开发者. All rights reserved.
//

#import "TouZiZhiNanLayout.h"
#import "TouZiZhiNanReusableView.h"

@implementation TouZiZhiNanLayout
-(void)prepareLayout{
    
    [super prepareLayout];
    [self registerClass:[TouZiZhiNanReusableView class] forDecorationViewOfKind:@"TZ"];
}

-(CGSize)collectionViewContentSize{

    return self.collectionView.frame.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path{
    

    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    attributes.size = CGSizeMake(100, 127);
    attributes.center=CGPointMake(50*(path.item+1), 62.5+125*path.section);
    return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    att.frame =  CGRectMake(0, 150*indexPath.section, SCREEN_WIDTH, 130);
    att.zIndex = -1;
    return att;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{

    NSMutableArray *attributes = [NSMutableArray array];
    for (int y = 0; y < 3; y++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:3 inSection:y];
        [attributes addObject:[self layoutAttributesForDecorationViewOfKind:@"TZ" atIndexPath:indexPath]];
    }
    
    for (NSInteger i = 0 ; i < 3; i++) {
        for (NSInteger t = 0;  t < 3; t++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:t inSection:i];
            [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
    
    return attributes;
}

@end
