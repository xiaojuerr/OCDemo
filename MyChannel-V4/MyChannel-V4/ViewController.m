//
//  ViewController.m
//  MyChannel-V4
//
//  Created by Theo on 2024/8/5.
//

#import "ViewController.h"

static const char *IndexPathKey = "IndexPathKey";

@interface ViewController ()
@property (nonatomic, strong) UICollectionView *collectionView;
//Theo's todo:viewmore/hide逻辑
@property (nonatomic , assign) NSInteger numberOfCellsToShow;
@property (nonatomic , strong) MyChannelDataManager *dataManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMyChannelDataManager];
    _numberOfCellsToShow = 4;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);
        layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
    
    //初始化 collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    // 注册 cell 和 supplementary views
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [self.collectionView registerClass:[FooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
    self.collectionView.allowsMultipleSelection = YES;
    
    [self.view addSubview:_collectionView];
   
}


- (void)updateCells
{
    [_collectionView reloadData];
}

#pragma mark CollectionViewDel
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _numberOfCellsToShow;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.item = [_dataManager itemAtindex:indexPath.row];
    cell.indexPath = indexPath;
    cell.gestureDel = self;
    [cell addGesturesToCell:cell];
    //Theo‘mark: 在这绑定数据
    cell.backgroundColor = [UIColor blueColor];
    cell.label = [UILabel new];
    cell.label.text = cell.item.title;
    [cell.label setFrame:(CGRectMake(0, 0, 100, 100))];
    [cell.label setTextColor:[UIColor redColor]];
    
    UIButton *stickTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stickTopButton.frame = CGRectMake(0, 0, 100, 30);
    stickTopButton.backgroundColor = [UIColor redColor];
    //[cell.stickTopButton addTarget:self action:@selector(unstickTop:) forControlEvents:(UIControlEventTouchUpInside)];
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
    [cell.contentView addSubview:cell.label];
    [self configureCell:cell];
//    [cell bindViewModel:item];
    return cell;
}

-(void)configureCell:(MyCollectionViewCell *)cell
{
    UIView *subView;
    for (subView in cell.contentView.subviews) {
        if ([subView isKindOfClass:[UIButton class]] && [subView.accessibilityIdentifier isEqualToString:@"uniqueID_stickTopButton"]) {
                if([_dataManager itemAtindex:cell.indexPath.row].status == ChannelStatusNormal){
                    subView.hidden = YES;
                }else{
                    subView.hidden = NO;
                }
        }
    }
    //[self updateCells];
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

#pragma mark handlerGesture
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer 
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
            CGPoint location = [gestureRecognizer locationInView:self.collectionView];
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
            NSLog(@"%@",indexPath);
            if (indexPath) {
                [_dataManager eidtingItemWithIndex:indexPath.row];
            }
        [self updateCells];
    }
}
- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer
{
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[gestureRecognizer locationInView:self.collectionView]];
    NSLog(@"%@",indexPath);
    if(indexPath){
        [_dataManager cancelEidtingItemWithIndex:indexPath.row];
    }
    [self updateCells];
}


#pragma mark Stick/UnstickTop
-(void)stickTop:(UIButton *)sender
{
    NSLog(@"Top");
    NSIndexPath *indexPath = objc_getAssociatedObject(sender, IndexPathKey);
    if(indexPath){
        NSLog(@"%lu",indexPath.row);
        [_dataManager moveItemToTopWithIndex:indexPath.row];
    }
    [self updateCells];
}
-(void)unstickTop:(UIButton *)sender
{
    NSIndexPath *indexPath = objc_getAssociatedObject(sender, IndexPathKey);
    if(indexPath){
        [_dataManager cancelMoveItemToTopWithIndex:indexPath.row];
    }
    [self updateCells];
}

#pragma mark HandleFooter/Header
-(void)selectAllCells
{
    
    if(!_dataManager.isGlobalEditing){
        NSLog(@"select ALL");
        [_dataManager enterGlobalEditingState];
    }else [_dataManager exitGlobalEditingState];
    [self updateCells];
}

-(void)loadMore
{
    ItemList *data2 = [ItemList new];
    data2.actionUrl = @"https://pages.lazada.sg/wow/gcp/route/lazada/sg/upr_1000345_lazada/channel/sg/upr-router/sg?hybrid=1&data_prefetch=true&prefetch_replace=1&at_iframe=1&wh_pid=/lazada/channel/sg/interactions/laz-coins&pha=true&lzd_navbar_hidden=true&wx_navbar_transparent=true&dsource=hp_icon";
    data2.bgEndColor = @"#33FFF9F9";
    data2.bgStartColor = @"#33FFF9F9";
    data2.isTop = @"0";
    data2.itemList = [NSArray new];
    data2.key = @"Coins";
    data2.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i2/O1CN01jNYbF129Mmt2XFzuN_!!6000000008054-2-tps-144-56.png";
    data2.linkText = @"testView";
    data2.title = @"test1";
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
        data3.title = @"test2";
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

//全选状态下禁止单独选中/取消选中
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    return ([_dataManager itemAtindex:indexPath.row].status != ChannelStatusAllEdit);
//}
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
//    return ([_dataManager itemAtindex:indexPath.row].status != ChannelStatusAllEdit);
//}


-(void)initMyChannelDataManager
{
    _dataManager = [MyChannelDataManager new];

    ItemList *data1 = [ItemList new];
    data1.actionUrl = @"https://www.lazada.sg/wow/i/sg/miniapp/page?_ariver_appid=2161010045134852";
    data1.bgEndColor = @"#99FAF2FF";
    data1.bgStartColor = @"#CCF7EBFF";
    data1.isTop = @"1";
    data1.itemList = [NSArray new];
    data1.key = @"LazLive";
    data1.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i3/O1CN01gFynfR1Myseiu1454_!!6000000001504-2-tps-144-56.png";
    data1.linkText = @"View";
    data1.title = @"LazLive";
    data1.titleExtend = [NSArray new];
    data1.type = 1;
    data1.status = ChannelStatusNormal;
    //[_dataManager.itemList addObject:data1];
    
    ItemList *data2 = [ItemList new];
    data2.actionUrl = @"https://pages.lazada.sg/wow/gcp/route/lazada/sg/upr_1000345_lazada/channel/sg/upr-router/sg?hybrid=1&data_prefetch=true&prefetch_replace=1&at_iframe=1&wh_pid=/lazada/channel/sg/interactions/laz-coins&pha=true&lzd_navbar_hidden=true&wx_navbar_transparent=true&dsource=hp_icon";
    data2.bgEndColor = @"#33FFF9F9";
    data2.bgStartColor = @"#33FFF9F9";
    data2.isTop = @"0";
    data2.itemList = [NSArray new];
    data2.key = @"Coins";
    data2.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i2/O1CN01jNYbF129Mmt2XFzuN_!!6000000008054-2-tps-144-56.png";
    data2.linkText = @"testView";
    data2.title = @"Cointest";
    data2.titleExtend = [NSArray new];
    data2.type = 1;
    data2.status = ChannelStatusNormal;
    //[_dataManager.itemList addObject:data2];
    
    ItemList *data3 = [ItemList new];
    data3.actionUrl = @"https://pages.lazada.sg/wow/gcp/route/lazada/sg/upr_1000345_lazada/channel/sg/upr-router/sg?hybrid=1&data_prefetch=true&prefetch_replace=1&at_iframe=1&wh_pid=/lazada/channel/sg/interactions/laz-coins&pha=true&lzd_navbar_hidden=true&wx_navbar_transparent=true&dsource=hp_icon";
    data3.bgEndColor = @"#33FFF9F9";
    data3.bgStartColor = @"#33FFF9F9";
    data3.isTop = @"0";
    data3.itemList = [NSArray new];
    data3.key = @"Coins";
    data3.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i2/O1CN01jNYbF129Mmt2XFzuN_!!6000000008054-2-tps-144-56.png";
    data3.linkText = @"testView";
    data3.title = @"LazMall";
    data3.titleExtend = [NSArray new];
    data3.type = 1;
    data3.status = ChannelStatusNormal;
   // [_dataManager.itemList addObject:data3];

    ItemList *data4 = [ItemList new];
    data4.actionUrl = @"https://pages.lazada.sg/wow/gcp/route/lazada/sg/upr_1000345_lazada/channel/sg/upr-router/sg?hybrid=1&data_prefetch=true&prefetch_replace=1&at_iframe=1&wh_pid=/lazada/channel/sg/interactions/laz-coins&pha=true&lzd_navbar_hidden=true&wx_navbar_transparent=true&dsource=hp_icon";
    data4.bgEndColor = @"#33FFF9F9";
    data4.bgStartColor = @"#33FFF9F9";
    data4.isTop = @"0";
    data4.itemList = [NSArray new];
    data4.key = @"Coins";
    data4.linkBgImgUrl = @"https://img.alicdn.com/imgextra/i2/O1CN01jNYbF129Mmt2XFzuN_!!6000000008054-2-tps-144-56.png";
    data4.linkText = @"testView";
    data4.title = @"Choice";
    data4.titleExtend = [NSArray new];
    data4.type = 1;
    data4.status = ChannelStatusNormal;
   // [_dataManager.itemList addObject:data4];
    NSArray <ItemList *> *list = [[NSArray alloc] initWithObjects:data1 , data2 , data3 , data4 , nil];
    [_dataManager initWithItemList:list withMaxTopCardNumber:4];
}
@end
