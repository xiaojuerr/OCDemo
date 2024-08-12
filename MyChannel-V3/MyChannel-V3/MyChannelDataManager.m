//
//  MyChannelDataManager.m
//  MyChannel-V3
//
//  Created by Theo on 2024/8/1.
//

#import "MyChannelDataManager.h"

@interface MyChannelDataManager ()

@property (nonatomic, assign) BOOL isGlobalEditing;

@end

@implementation MyChannelDataManager
#pragma mark init/get
- (void)initDataWithItemList:(NSArray<ItemList *> *)items
{
    _itemList = [items mutableCopy];
    _topedCardNumber = 0;
    _curEditingItemIndex = -1;
    for(ItemList *item in items){
        if(item.isTop){
            _topedCardNumber += 1;
        }else return ;
    }
}

-(NSArray *)getItemList
{
    if(!_itemList) return nil;
    else return [_itemList copy];
}


- (void)enterGlobalEditingState
{
    if(_isGlobalEditing) return;
    _isGlobalEditing = YES;
    _curEditingItemIndex = -1;
    for(ItemList *item in _itemList){
        item.status = ChannelStatusAllEdit;
    }
}

- (void)exitGlobalEditingState
{
    
    if(!_isGlobalEditing) return;
    _isGlobalEditing = NO;
    for(ItemList *item in _itemList){
        item.status = ChannelStatusNormal;
    }
    return ;
}

- (void)eidtingItemWithIndex:(NSInteger)index
{
    if(_curEditingItemIndex != -1){
        _itemList[_curEditingItemIndex].status = ChannelStatusNormal;
    }
    _curEditingItemIndex = index;
    _itemList[_curEditingItemIndex].status = ChannelStatusEdit;
}
- (void)moveItemToTopWithIndex:(NSInteger)index
{
    if(_topedCardNumber == 4) {
        //超数提醒
        return ;
    }
    BOOL SUC = YES;//mtop网络请求部分
    if(SUC){
        [_itemList objectAtIndex:index].isTop = @"1";
        _topedCardNumber += 1;
        [self moveItemToFirstPosition:index];
    }else{
        //网络提醒
        return ;
    }
   
}

- (void)cancelMoveItemToTopWithIndex:(NSInteger)index
{
    BOOL SUC = YES;//mtop网络请求部分
    if(SUC){
        [_itemList objectAtIndex:index].isTop = @"0";
        _topedCardNumber -= 1;
        [self removeItemFromFirstPosition:index];
    }else{
        //网络提醒
        return ;
    }
    
}

- (void)appendItemsToItemList:(NSArray <ItemList *> *)items
{
    if(!items){
        return ;
    }
    if (!_itemList) {
            _itemList = [NSMutableArray array];
        }
    if(_isGlobalEditing){
        for(ItemList *item in items) item.status = ChannelStatusAllEdit;
    }else{
        for(ItemList *item in items) item.status = ChannelStatusNormal;
    }
    [_itemList addObjectsFromArray:items];
    for(ItemList *item in _itemList) NSLog(@"%@",item.title);
    return ;
}

- (void)moveItemToFirstPosition:(NSInteger)index
{
    // 先将 item 移动到数组开头
    ItemList *temp = [_itemList objectAtIndex:index];
    [self.itemList removeObjectAtIndex:index];
    [self.itemList insertObject:temp atIndex:0];
}

- (void)removeItemFromFirstPosition:(NSInteger)index
{
    NSInteger pos = (_topedCardNumber);
    ItemList *temp = [_itemList objectAtIndex:index];
    
    [_itemList removeObjectAtIndex:index];
    [self.itemList insertObject:temp atIndex:pos];
    
}



@end

