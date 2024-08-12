//
//  MyChannelDataManager.h
//  MyChannel-V2
//
//  Created by Theo on 2024/7/31.
//

#import <Foundation/Foundation.h>
#import "ItemList.h"
NS_ASSUME_NONNULL_BEGIN


@interface MyChannelDataManager : NSObject
//全局状态控制变量
#pragma mark OverallStatusController
@property (nonatomic , assign) BOOL isGlobalEditing;
@property (nonatomic, strong) NSMutableArray <ItemList *> *itemList;
@property (nonatomic , assign) NSInteger topedCardNumber;
@property (copy, nonatomic) NSString *hasMore;

#pragma mark Callback
@property (nonatomic, copy) void (^globalEditingStateChanged)(BOOL isGlobalEditing);

#pragma mark HandleLogic
- (void)initDataWithItemList:(NSArray <ItemList *> *)items;
- (void)appendItemsToItemList:(NSArray <ItemList *> *)items;
- (void)enterGlobalEditingState;
- (void)exitGlobalEditingState;
- (void)moveItemToTop:(ItemList *)item;
- (void)cancelMoveItemToTop:(ItemList *)item;
- (void)moveItemToFirstPosition:(ItemList *)item;
- (void)removeItemFromFirstPosition:(ItemList *)item;
- (NSArray *)getItemList;
@end


NS_ASSUME_NONNULL_END
