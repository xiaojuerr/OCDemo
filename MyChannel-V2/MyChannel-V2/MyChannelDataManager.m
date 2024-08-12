//
//  MyChannelDataManager.m
//  MyChannel-V2
//
//  Created by Theo on 2024/7/31.
//

#import "MyChannelDataManager.h"


@implementation MyChannelDataManager
- (void)initDataWithItemList:(NSArray<ItemList *> *)items
{
    _itemList = [items mutableCopy];
    _topedCardNumber = 0;
    for(ItemList *item in items){
        if(item.isTop){
            _topedCardNumber += 1;
        }else return;
    }
}
//直接通过回调来处理全局编辑状态
- (void)enterGlobalEditingState
{
    if(_isGlobalEditing) return;
    _isGlobalEditing = YES;
    if(_globalEditingStateChanged){
        _globalEditingStateChanged(_isGlobalEditing);
    }
    return;
}

- (void)exitGlobalEditingState
{
    if(!_isGlobalEditing) return;
    _isGlobalEditing = NO;
    if(_globalEditingStateChanged){
        _globalEditingStateChanged(_isGlobalEditing);
    }
    return;
}
- (void)moveItemToTop:(ItemList *)item
{
    if(_topedCardNumber == 4) {
        //超数提醒
        return ;
    }
    BOOL SUC = YES;//mtop网络请求部分
    if(SUC){
        item.isTop = @"1";
        _topedCardNumber += 1;
        [self moveItemToFirstPosition:item];
    }else{
        //网络提醒
        return ;
    }
   
}

- (void)cancelMoveItemToTop:(ItemList *)item
{
    BOOL SUC = YES;//mtop网络请求部分
    if(SUC){
        item.isTop = @"0";
        _topedCardNumber -= 1;
        [self removeItemFromFirstPosition:item];
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
    [_itemList addObjectsFromArray:items];
    return ;
}

- (void)moveItemToFirstPosition:(ItemList *)item
{
    NSUInteger index = [self.itemList indexOfObject:item];
    // 先将 item 移动到数组开头
    [self.itemList removeObjectAtIndex:index];
    [self.itemList insertObject:item atIndex:0];
}

- (void)removeItemFromFirstPosition:(ItemList *)item
{
    NSInteger pos = _topedCardNumber - 1;
    NSUInteger index = [_itemList indexOfObject:item];
    [_itemList removeObjectAtIndex:index];
    [self.itemList insertObject:item atIndex:pos];
    
}

-(NSArray *)getItemList
{
    if(!_itemList) return nil;
    else return [_itemList copy];
}


@end


