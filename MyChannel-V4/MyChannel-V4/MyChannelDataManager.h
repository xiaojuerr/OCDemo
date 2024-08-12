//
//  MyChannelDataManager.h
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import <Foundation/Foundation.h>
#import "ItemList.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FooterStatus) {
    FooterStatusViewMore = 0,
    FooterStatusHide,
    FooterStatusBoth,
    FooterStatusEmpty
};

@interface MyChannelDataManager : NSObject
//全局状态控制变量
#pragma mark OverallStatusController
@property (nonatomic, readonly, assign) BOOL isGlobalEditing;
@property (nonatomic, strong) NSMutableArray <ItemList *> *itemList;
@property (nonatomic , assign) NSInteger topedCardNumber;
@property (nonatomic , assign , readonly) NSInteger maxTopCardNumber;
@property (copy, nonatomic) NSString *hasMore;
@property (nonatomic , assign) NSInteger curEditingItemIndex;

//新增
@property (nonatomic , assign, readonly) NSInteger numberOfCellsToShow;
@property (nonatomic, assign , readonly) FooterStatus footerStatus;

#pragma mark HandleLogic
//Theo's todo
- (instancetype)initWithItemList:(NSArray<ItemList *> *)items withMaxTopCardNumber:(NSInteger) maxTopCardNumber;
//- (void)initDataWithItemList:(NSArray <ItemList *> *)items;
- (void)appendItemsToItemList:(NSArray <ItemList *> *)items;
- (ItemList *)itemAtindex:(NSInteger )index;

- (void)enterGlobalEditingState;
- (void)exitGlobalEditingState;

- (void)moveItemToTopWithIndex:(NSInteger)index;
- (void)cancelMoveItemToTopWithIndex:(NSInteger)index;

- (void)eidtingItemWithIndex:(NSInteger)index;
- (void)cancelEidtingItemWithIndex:(NSInteger)index;

//新增逻辑处理
- (NSInteger)vireMore;
- (NSInteger)hide;
- (NSInteger) getFooterStatus;

@end


NS_ASSUME_NONNULL_END
