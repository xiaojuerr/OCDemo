//
//  ViewController.m
//  MyAccountController-V1
//
//  Created by Theo on 2024/7/30.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "FooterView.h"


@interface ViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , assign) BOOL isAllSelected;
@property (nonatomic , assign) BOOL isTop;
@property (nonatomic , strong) UILongPressGestureRecognizer *longPressGesture;
@property (nonatomic, assign) NSInteger numberOfCellsToShow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _isAllSelected = NO;
    _isTop = NO;
    self.numberOfCellsToShow = 4;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);
        layout.footerReferenceSize = CGSizeMake(self.view.frame.size.width, 30);
        self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 20; ++i) {
            [self.dataArray addObject:@(i)];
        }
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

#pragma mark UICollectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.numberOfCellsToShow;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    //为cell添加长按事件
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    //longPressGesture.minimumPressDuration = 0.1;
    longPressGesture.delegate = self;
    [cell addGestureRecognizer:longPressGesture];
    
    //为cell添加点击事件
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        tapGesture.delegate = self;
        [cell addGestureRecognizer:tapGesture];
    cell.backgroundColor = [UIColor blueColor];
    
    
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

#pragma mark SelectAll
-(void)selectAllCells
{
    NSLog(@"Tapped");
    self.isAllSelected = !self.isAllSelected;
    for (int section = 0; section < [self.collectionView numberOfSections]; section++) {
            for (int item = 0; item < [self.collectionView numberOfItemsInSection:section]; item++) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
                if (self.isAllSelected) {
                            [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
                            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
                            if (cell) {
                                [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
                                [self updateInteractionForSelectAllState:cell];
                                }
                        } else {
                            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
                            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
                            if (cell) {
                                [self collectionView:self.collectionView didDeselectItemAtIndexPath:indexPath];
                                }
                            [self updateInteractionForSelectAllState:cell];
                        }
            }
        }
}

#pragma mark HandleGesture
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
            CGPoint location = [gestureRecognizer locationInView:self.collectionView];
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:location];
            
            if (indexPath) {
                // Deselect all other cells
                for (NSIndexPath *index in self.collectionView.indexPathsForSelectedItems) {
                    [self.collectionView deselectItemAtIndexPath:index animated:NO];
                    [self collectionView:self.collectionView didDeselectItemAtIndexPath:index];
                }
                // Select the current cell
                [self.collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
                [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
            }
        }
}

- (void)handleTap:(UITapGestureRecognizer *)gestureRecognizer {
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[gestureRecognizer locationInView:self.collectionView]];
    if (indexPath) {
        // Handle tap to navigate to another screen
        NSLog(@"跳转至");
    }
}

#pragma mark GestureDel
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
    if(_isAllSelected){
        return NO;
    }else return YES;
}
//选中和不选中的逻辑
#pragma mark Selected/Deselect

//选中逻辑
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell) {
        UIButton *stickTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        stickTopButton.frame = CGRectMake(0, 0, 100, 30);
        stickTopButton.backgroundColor = [UIColor redColor];
        if(_isTop){
            //替换自己风格的button
            [stickTopButton setTitle:@"Cancel Stick on Top" forState:UIControlStateNormal];
            stickTopButton.titleLabel.adjustsFontSizeToFitWidth = YES;
            [stickTopButton addTarget:self action:@selector(unstickTop) forControlEvents:(UIControlEventTouchUpInside)];
            stickTopButton.tag = 1;
            _isTop = !_isTop;
        }else{
            [stickTopButton setTitle:@"Stick on Top" forState:UIControlStateNormal];
            stickTopButton.titleLabel.adjustsFontSizeToFitWidth = YES;
            [stickTopButton addTarget:self action:@selector(stickTop) forControlEvents:(UIControlEventTouchUpInside)];
            _isTop = !_isTop;
            stickTopButton.tag = 1;
        }
        stickTopButton.accessibilityIdentifier = @"uniqueID_stickTopButton";
        [cell.contentView addSubview:stickTopButton];
    }
}

//取消选中逻辑

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell) {
        // 移除按钮或其他子视图
        for (UIView *subview in cell.contentView.subviews) {
            if ([subview isKindOfClass:[UIButton class]]) {
                [subview removeFromSuperview];
            }
        }
    }
}

//全选状态下禁止单独选中/取消选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return !self.isAllSelected;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    return !self.isAllSelected;
}

#pragma mark Top/Untop
-(void)stickTop
{
    NSLog(@"toTop");
}
-(void)unstickTop
{
    NSLog(@"notToTop");
}

#pragma mark AllSelectInteraction
//全部选中下的交互逻辑
-(void)updateInteractionForSelectAllState: (UICollectionViewCell *)cell
{
    if(_isAllSelected){
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
    if (self.numberOfCellsToShow < self.dataArray.count) {
        self.numberOfCellsToShow += 2;
        
        // 防止超过数据总量
        if (self.numberOfCellsToShow > self.dataArray.count) {
            self.numberOfCellsToShow = self.dataArray.count;
        }
        
        
        // 刷新UICollectionView
        [self.collectionView reloadData];
    }
}
@end
