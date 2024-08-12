//
//  MyCollectionViewCell.h
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import <UIKit/UIKit.h>
#import "objc/runtime.h"
#import "GestureHandlerProtocol.h"
#import "ItemList.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyCollectionViewCell : UICollectionViewCell <UIGestureRecognizerDelegate>
@property (nonatomic ,assign) NSIndexPath *indexPath;
@property (nonatomic , strong) ItemList *item;
@property (nonatomic, weak) id<GestureHandlerProtocol> gestureDel;
@property (nonatomic , strong) UILabel *label;

- (void)addGesturesToCell:(UICollectionViewCell *)cell;
@end

NS_ASSUME_NONNULL_END
