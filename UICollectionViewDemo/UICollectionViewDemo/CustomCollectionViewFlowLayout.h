//
//  CustomerCollectionViewFlowLayout.h
//  UICollectionViewDemo
//
//  Created by Theo on 2024/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCollectionViewFlowLayout : UICollectionViewFlowLayout
@property (nonatomic , strong) NSMutableArray *attributesArray;
@property (nonatomic , assign) CGFloat contentHeight;
@end

NS_ASSUME_NONNULL_END
