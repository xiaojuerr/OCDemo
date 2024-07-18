//
//  CustomerCollectionViewFlowLayout.m
//  UICollectionViewDemo
//
//  Created by Theo on 2024/7/17.
//

#import "CustomCollectionViewFlowLayout.h"

@implementation CustomCollectionViewFlowLayout
-(void)prepareLayout
{
    [super prepareLayout];
    
    self.attributesArray = [NSMutableArray array];
    self.contentHeight = 0;
    CGFloat columnWidth = self.collectionView.bounds.size.width / 2;
    CGFloat xOffsets[2] = {0, columnWidth};
    CGFloat yOffsets[2] = {0,0};
    NSInteger itemsCount = [self.collectionView numberOfItemsInSection:0];
    NSLog(@"%ld",itemsCount);
    for(NSInteger i = 0; i < itemsCount; i++){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        CGFloat heght = 100 + arc4random_uniform(100); //随机高度
        CGRect frame = CGRectMake(xOffsets[i % 2], yOffsets[i % 2], columnWidth, heght);
        CGFloat interval = 1.0;
        yOffsets[i % 2] += (heght+interval);
        
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attribute.frame = frame;
        [self.attributesArray addObject:attribute];
        
        self.contentHeight = MAX(self.contentHeight, yOffsets[i % 2]);
    }
}

-(CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.bounds.size.width, self.contentHeight);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *visbleAttributes = [NSMutableArray array];
    for(UICollectionViewLayoutAttributes *attribute in self.attributesArray)
    {
        if(CGRectIntersectsRect(attribute.frame, rect)){
            [visbleAttributes addObject:attribute];
        }
    }
    return visbleAttributes;
}


@end
