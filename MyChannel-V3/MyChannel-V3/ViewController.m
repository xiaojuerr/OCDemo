//
//  ViewController.m
//  MyChannel-V3
//
//  Created by Theo on 2024/8/1.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "FooterView.h"
#import "MyChannelDataManager.h"
#import <objc/runtime.h>

static const char *IndexPathKey = "IndexPathKey";

@interface ViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic , strong) UILongPressGestureRecognizer *longPressGesture;
@property (nonatomic, assign) NSInteger numberOfCellsToShow;
@property (nonatomic , strong) MyChannelDataManager *dataManager;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMyChannelDataManager];
    self.numberOfCellsToShow = 2;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);
        layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
        
        // 初始化 collectionView
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];

        // 注册 cell 和 supplementary views
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        [self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        [self.collectionView registerClass:[FooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
        self.collectionView.allowsMultipleSelection = YES;
        [self.view addSubview:self.collectionView];
    
}

-(void)initMyChannelDataManager
{
    _dataManager = [MyChannelDataManager new];
//    _dataManager.isGlobalEditing = NO;
    _dataManager.topedCardNumber = 0;
    _dataManager.hasMore = @"1";
    _dataManager.itemList = [NSMutableArray new];
    
        ItemList *data1 = [ItemList new];
        data1.actionUrl = @"https://www.lazada.sg/wow/i/sg/miniapp/page?_ariver_appid=2161010045134852";
        data1.bgEndColor = @"#99FAF2FF";
        data1.bgStartColor = @"#CCF7EBFF";
        data1.isTop = @"0";
        data1.itemList = [NSArray new];
        data1.key = @"LazLive";
        data1.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i3/O1CN01gFynfR1Myseiu1454_!!6000000001504-2-tps-144-56.png";
        data1.linkText = @"View";
        data1.title = @"LazLive";
        data1.titleExtend = [NSArray new];
        data1.type = 1;
        data1.status = ChannelStatusNormal;
        [_dataManager.itemList addObject:data1];
    
    ItemList *data = [ItemList new];
    data.actionUrl = @"https://pages.lazada.sg/wow/gcp/route/lazada/sg/upr_1000345_lazada/channel/sg/upr-router/sg?hybrid=1&data_prefetch=true&prefetch_replace=1&at_iframe=1&wh_pid=/lazada/channel/sg/interactions/laz-coins&pha=true&lzd_navbar_hidden=true&wx_navbar_transparent=true&dsource=hp_icon";
    data.bgEndColor = @"#33FFF9F9";
    data.bgStartColor = @"#33FFF9F9";
    data.isTop = @"0";
    data.itemList = [NSArray new];
    data.key = @"Coins";
    data.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i2/O1CN01jNYbF129Mmt2XFzuN_!!6000000008054-2-tps-144-56.png";
    data.linkText = @"testView";
    data.title = @"Cointest";
    data.titleExtend = [NSArray new];
    data.type = 1;
    data.status = ChannelStatusNormal;
    [_dataManager.itemList addObject:data];
    
    
}

//把手势处理抽出出来做一个单独的类
#pragma mark UICollectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _numberOfCellsToShow;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    id itemList = [_dataManager itemAtIndex:indexPath.item];
//    viewModel.model = itemList;
//    [cell bindViewModel:viewModel];
    
    [self addGesturesToCell:cell];
    
    cell.backgroundColor = [UIColor blueColor];
    UILabel *label = [UILabel new];
    label.text = [_dataManager.itemList objectAtIndex:(NSUInteger)indexPath.row].title;
    [label setFrame:(CGRectMake(0, 0, 100, 100))];
    [label setTextColor:[UIColor redColor]];
    
    UIButton *stickTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stickTopButton.frame = CGRectMake(0, 0, 100, 30);
    stickTopButton.backgroundColor = [UIColor redColor];
    if([[_dataManager.itemList objectAtIndex:(NSUInteger)indexPath.row].isTop isEqualToString:@"1"]){
        //替换自己风格的button
        [stickTopButton setTitle:@"Cancel Stick on Top" forState:UIControlStateNormal];
        stickTopButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [stickTopButton addTarget:self action:@selector(unstickTop:) forControlEvents:(UIControlEventTouchUpInside)];
        stickTopButton.tag = 1;
    }else{
        [stickTopButton setTitle:@"Stick on Top" forState:UIControlStateNormal];
        stickTopButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [stickTopButton addTarget:self action:@selector(stickTop:) forControlEvents:(UIControlEventTouchUpInside)];
        stickTopButton.tag = 1;
    }
    stickTopButton.accessibilityIdentifier = @"uniqueID_stickTopButton";
    stickTopButton.hidden = YES;
    //通过关联对象将indexPath和button关联起来
    objc_setAssociatedObject(stickTopButton, IndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [cell.contentView addSubview:stickTopButton];
    [cell.contentView addSubview:label];
    [self configureCell:cell withIndexPath:indexPath];
    return cell;
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        [header.btn addTarget:self action:@selector(selectAllCells) forControlEvents:(UIControlEventTouchUpInside)];
        return header;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        FooterView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        [footer.btn addTarget:self action:@selector(loadMore) forControlEvents:(UIControlEventTouchUpInside)];
        return footer;
    }
    return [UICollectionReusableView new];
}

//配置cell的button的可见状态
-(void)configureCell:(UICollectionViewCell *)cell withIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    UIView *subView;
    for (subView in cell.contentView.subviews) {
        if ([subView isKindOfClass:[UIButton class]] && [subView.accessibilityIdentifier isEqualToString:@"uniqueID_stickTopButton"]) {
                if([_dataManager.itemList objectAtIndex:(NSUInteger)indexPath.row].status == ChannelStatusNormal){
                    subView.hidden = YES;
                }else{
                    subView.hidden = NO;
                }
        }
    }
}

-(void)updateCells{
//    [self.collectionView reloadData];
//    [self.collectionView performBatchUpdates:^{
//                for (NSInteger section = 0; section < [self.collectionView numberOfSections]; section++) {
//                    for (NSInteger item = 0; item < [self.collectionView numberOfItemsInSection:section]; item++) {
//                        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
//                        [self configureCellWithIndexPath:indexPath];
//                    }
//                }
//            } completion:nil];
}
#pragma mark SelectAll
-(void)selectAllCells
{
    NSLog(@"Tapped");
    if(!_dataManager.isGlobalEditing){
        [_dataManager enterGlobalEditingState];
    }else{
        [_dataManager exitGlobalEditingState];
    }
    
//    for (int section = 0; section < [self.collectionView numberOfSections]; section++) {
//        for (int item = 0; item < [self.collectionView numberOfItemsInSection:section]; item++) {
//            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
//            [self configureCellWithIndexPath:indexPath];
//        }
//    }
    [_collectionView reloadData];
    [self updateCells];
   
}



#pragma mark HandleGesture
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
            CGPoint location = [gestureRecognizer locationInView:self.collectionView];
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
            NSLog(@"%@",indexPath);
            if (indexPath) {
                /*
                 if (isAllEditing) {
                 } else if () {
                 
                 }
                 */
                if(indexPath.row == _dataManager.curEditingItemIndex){
                    [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusNormal;
                    _dataManager.curEditingItemIndex = -1;
                }else{
                    if(_dataManager.curEditingItemIndex != -1){
                        [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusNormal;
                    }
                    _dataManager.curEditingItemIndex = indexPath.row;
                    [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusEdit;
                }
            }
    }
    [self updateCells];
}

- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    //CGPoint location = [gestureRecognizer locationInView:_collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[gestureRecognizer locationInView:self.collectionView]];
    NSLog(@"%@",indexPath);
    if (indexPath) {
        if(_dataManager.curEditingItemIndex != -1){
            [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusNormal;
            _dataManager.curEditingItemIndex = -1;
        }
    }
    
    [self updateCells];
}

#pragma mark GestureDel
- (void)addGesturesToCell:(UICollectionViewCell *)cell {
    // 检查是否已经添加了手势识别器
    if (![self hasGestureRecognizersInView:cell]) {
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        longPressGesture.delegate = self;
        [cell addGestureRecognizer:longPressGesture];

        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tapGesture.delegate = self;
        [cell addGestureRecognizer:tapGesture];
    }
}
- (BOOL)hasGestureRecognizersInView:(UIView *)view {
    for (UIGestureRecognizer *gesture in view.gestureRecognizers) {
        if ([gesture isKindOfClass:[UILongPressGestureRecognizer class]] || [gesture isKindOfClass:[UITapGestureRecognizer class]]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // Allow multiple gestures to be recognized simultaneously
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // Ensure long press gesture has higher priority over tap gesture
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if(_dataManager.isGlobalEditing){
        return NO;
    }else return YES;
}
//选中和不选中的逻辑
#pragma mark Selected/Deselect

//选中逻辑
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell) {
        if(_dataManager.curEditingItemIndex != -1){
            [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusNormal;
        }
        _dataManager.curEditingItemIndex = indexPath.row;
        [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusEdit;
    }
    [_collectionView reloadData];
    [self updateCells];
}

//取消选中逻辑

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell) {
        // 移除按钮或其他子视图
        [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusNormal;
        _dataManager.curEditingItemIndex = -1;
    }
    [_collectionView reloadData];
    [self updateCells];
}

//全选状态下禁止单独选中/取消选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return !self.dataManager.isGlobalEditing;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return !self.dataManager.isGlobalEditing;
}

#pragma mark Top/Untop
-(void)stickTop:(UIButton *)sender
{
    NSLog(@"toTop");
    NSIndexPath *indexPath = objc_getAssociatedObject(sender, IndexPathKey);
    NSLog(@"%@",indexPath);
    if(indexPath){
        if(!_dataManager.isGlobalEditing){
            [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusNormal;
            _dataManager.curEditingItemIndex = -1;
            [_dataManager moveItemToTopWithIndex:indexPath.row];
        }else{
            [_dataManager moveItemToTopWithIndex:indexPath.row];
        }
        
    }
    [_collectionView reloadData];
    [self updateCells];
    //[_collectionView reloadData];
}
-(void)unstickTop:(UIButton *)sender
{
    NSLog(@"notToTop");
    NSIndexPath *indexPath = objc_getAssociatedObject(sender, IndexPathKey);
    
    if(indexPath){
        if(!_dataManager.isGlobalEditing){
            [_dataManager.itemList objectAtIndex:_dataManager.curEditingItemIndex].status = ChannelStatusNormal;
            _dataManager.curEditingItemIndex = -1;
            [_dataManager cancelMoveItemToTopWithIndex:indexPath.row];
        }else{
            [_dataManager cancelMoveItemToTopWithIndex:indexPath.row];
        }
    }
    //
    [_collectionView reloadData];
    [self updateCells];
}

#pragma mark AllSelectInteraction
//全部选中下的交互逻辑
-(void)updateInteractionForSelectAllState: (UICollectionViewCell *)cell
{
    if(_dataManager.isGlobalEditing){
        for (UIView *subview in cell.contentView.subviews) {
            if ([subview isKindOfClass:[UIButton class]]) {
                if([subview.accessibilityIdentifier isEqualToString:@"uniqueID_stickTopButton"]){
                    subview.userInteractionEnabled = YES;
                }
            }else{
                if([subview.accessibilityIdentifier isEqualToString:@"uniqueID_stickTopButton"]){
                    subview.userInteractionEnabled = NO;
                }
            }
        }

    }else{
        for (UIView *subview in cell.contentView.subviews){
            subview.userInteractionEnabled = YES;
        }
    }
    
}

#pragma mark LoadMore
- (void)loadMore {
    // 确保不会超过数据的总量
    ItemList *data2 = [ItemList new];
    data2.actionUrl = @"https://pages.lazada.sg/wow/gcp/route/lazada/sg/upr_1000345_lazada/channel/sg/upr-router/sg?hybrid=1&data_prefetch=true&prefetch_replace=1&at_iframe=1&wh_pid=/lazada/channel/sg/interactions/laz-coins&pha=true&lzd_navbar_hidden=true&wx_navbar_transparent=true&dsource=hp_icon";
    data2.bgEndColor = @"#33FFF9F9";
    data2.bgStartColor = @"#33FFF9F9";
    data2.isTop = @"0";
    data2.itemList = [NSArray new];
    data2.key = @"Coins";
    data2.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i2/O1CN01jNYbF129Mmt2XFzuN_!!6000000008054-2-tps-144-56.png";
    data2.linkText = @"testView";
    data2.title = @"3";
    data2.titleExtend = [NSArray new];
    data2.type = 1;
    data2.status = ChannelStatusNormal;
    
    
        ItemList *data3 = [ItemList new];
        data3.actionUrl = @"https://pages.lazada.sg/wow/gcp/route/lazada/sg/upr_1000345_lazada/channel/sg/upr-router/sg?hybrid=1&data_prefetch=true&prefetch_replace=1&at_iframe=1&wh_pid=/lazada/channel/sg/interactions/laz-coins&pha=true&lzd_navbar_hidden=true&wx_navbar_transparent=true&dsource=hp_icon";
        data3.bgEndColor = @"#33FFF9F9";
        data3.bgStartColor = @"#33FFF9F9";
        data3.isTop = @"0";
        data3.itemList = [NSArray new];
        data3.key = @"Coins";
        data3.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i2/O1CN01jNYbF129Mmt2XFzuN_!!6000000008054-2-tps-144-56.png";
        data3.linkText = @"testView";
        data3.title = @"4";
        data3.titleExtend = [NSArray new];
        data3.type = 1;
        data3.status = ChannelStatusNormal;
    NSArray<ItemList *> *appendList = [[NSArray alloc] initWithObjects:data2, data3, nil];
    [_dataManager appendItemsToItemList:appendList];
    
    if (self.numberOfCellsToShow < _dataManager.itemList.count) {
        self.numberOfCellsToShow += 2;
        // 防止超过数据总量
        if (self.numberOfCellsToShow > _dataManager.itemList.count) {
            self.numberOfCellsToShow =_dataManager.itemList.count;
        }
        // 刷新UICollectionView
        [self updateCells];
    }
}
@end
