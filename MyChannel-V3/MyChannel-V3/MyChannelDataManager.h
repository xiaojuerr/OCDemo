//
//  MyChannelDataManager.h
//  MyChannel-V3
//
//  Created by Theo on 2024/8/1.
//

#import <Foundation/Foundation.h>
#import "ItemList.h"
NS_ASSUME_NONNULL_BEGIN


@interface MyChannelDataManager : NSObject
//全局状态控制变量
#pragma mark OverallStatusController
@property (nonatomic, readonly, assign) BOOL isGlobalEditing;
@property (nonatomic, strong) NSMutableArray <ItemList *> *itemList;
@property (nonatomic , assign) NSInteger topedCardNumber;
@property (copy, nonatomic) NSString *hasMore;
@property (nonatomic , assign) NSInteger curEditingItemIndex;

#pragma mark HandleLogic
- (void)initDataWithItemList:(NSArray <ItemList *> *)items;
- (void)appendItemsToItemList:(NSArray <ItemList *> *)items;
- (void)enterGlobalEditingState;
- (void)exitGlobalEditingState;
- (void)moveItemToTopWithIndex:(NSInteger)index;
- (void)cancelMoveItemToTopWithIndex:(NSInteger)index;
- (void)eidtingItemWithIndex:(NSInteger)index;
//- (void)moveItemToFirstPosition:(ItemList *)item;
//- (void)removeItemFromFirstPosition:(ItemList *)item;
- (NSArray *)getItemList;
@end


NS_ASSUME_NONNULL_END
