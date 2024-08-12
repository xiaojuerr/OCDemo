//
//  MyChannelDataManager.m
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import "MyChannelDataManager.h"

@interface MyChannelDataManager ()

@property (nonatomic, assign) BOOL isGlobalEditing;
@property (nonatomic , assign) NSInteger numberOfCellsToShow;
@property (nonatomic , assign) FooterStatus footerStatus;
@end

@implementation MyChannelDataManager
#pragma mark init/get
//- (void)initDataWithItemList:(NSArray<ItemList *> *)items
//{
//    _itemList = [items mutableCopy];
//    _topedCardNumber = 0;
//    _curEditingItemIndex = -1;
//    _isGlobalEditing = NO;
//    for(ItemList *item in items){
//        if([item.isTop isEqualToString:@"1"]){
//            _topedCardNumber += 1;
//        }else return ;
//    }
//}
//alloc ]initWithItemList
- (instancetype)initWithItemList:(NSArray<ItemList *> *)items withMaxTopCardNumber:(NSInteger)maxTopCardNumber
{
    self = [super init];
    if(self){
        _itemList = [items mutableCopy];
        _topedCardNumber = 0;
        _curEditingItemIndex = -1;
        _isGlobalEditing = NO;
        _maxTopCardNumber = maxTopCardNumber;
        _numberOfCellsToShow = maxTopCardNumber;
        for(ItemList *item in items){
            if([item.isTop isEqualToString:@"1"]){
                _topedCardNumber += 1;
            }else break;
        }
    }
    return self;
}

-(ItemList *)itemAtindex:(NSInteger )index
{
    return [_itemList objectAtIndex:index];
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
    if(_isGlobalEditing) return ;
    if(_curEditingItemIndex != -1){
        if(_curEditingItemIndex == index) {
            [self cancelEidtingItemWithIndex:_curEditingItemIndex];
            return ;
        }
        else _itemList[_curEditingItemIndex].status = ChannelStatusNormal;
    }
    _curEditingItemIndex = index;
    _itemList[_curEditingItemIndex].status = ChannelStatusEdit;
}
- (void)cancelEidtingItemWithIndex:(NSInteger)index
{
    if(_isGlobalEditing) return ;
    if(_curEditingItemIndex == -1) return ;
    _itemList[_curEditingItemIndex].status = ChannelStatusNormal;
    _curEditingItemIndex = -1;
}

- (void)moveItemToTopWithIndex:(NSInteger)index
{
    NSLog(@"DataManager: %lu",index);
    //Theo's todo
    if(_topedCardNumber == 4) {
        NSLog(@"超过4个啦");
        return ;
    }
    BOOL SUC = YES;//mtop网络请求部分
    if(SUC){
        [_itemList objectAtIndex:index].isTop = @"1";
        _topedCardNumber += 1;
        [self cancelEidtingItemWithIndex:index];
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
        [self cancelEidtingItemWithIndex:index];
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
    for(ItemList *i in _itemList) NSLog(@"%@",i.title);
}
- (void)removeItemFromFirstPosition:(NSInteger)index
{
    NSInteger pos = (_topedCardNumber);
    ItemList *temp = [_itemList objectAtIndex:index];
    
    [_itemList removeObjectAtIndex:index];
    [self.itemList insertObject:temp atIndex:pos];
    
}
//新增处理
- (NSInteger)getFooterStatus
{
    if(([_hasMore isEqualToString:@"1"] && [_itemList count] == _maxTopCardNumber) || _numberOfCellsToShow < [_itemList count]){
        _footerStatus = FooterStatusViewMore;
    }else if([_hasMore isEqualToString:@"0"] && _numberOfCellsToShow == [_itemList count]){
        _footerStatus = FooterStatusHide;
    }else if([_hasMore isEqualToString:@"0"] && _maxTopCardNumber == [_itemList count]){
        _footerStatus = FooterStatusEmpty;
    }else{
        _footerStatus = FooterStatusBoth;
    }
    return _footerStatus;
}

- (NSInteger)vireMore
{
    if([_hasMore isEqualToString:@"0"]) return _numberOfCellsToShow;
    if(_numberOfCellsToShow < [_itemList count]) _numberOfCellsToShow = [_itemList count];
    else {
        
    }
    return _numberOfCellsToShow;
}
- (NSInteger)hide
{
    return _maxTopCardNumber;
}


@end
