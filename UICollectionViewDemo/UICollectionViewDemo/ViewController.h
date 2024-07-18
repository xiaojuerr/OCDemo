//
//  ViewController.h
//  UICollectionViewDemo
//
//  Created by Theo on 2024/7/17.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic , strong) UICollectionView *collectionView;

@end

