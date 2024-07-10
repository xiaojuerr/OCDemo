//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by Theo on 2024/7/8.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UILabel *label1;
    UIImageView *headImageView;
    UITableView *tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.backgroundColor = [UIColor clearColor];
    label1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    label1.backgroundColor = [UIColor redColor];
    //设置滚动视图的内容区域大小
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height*3);
    //设置内容区域的偏移量
    scrollView.contentOffset = CGPointMake(0, 0);
    //设置内容区域大小的偏移量
    scrollView.contentInset = UIEdgeInsetsMake(30, 10, 10, 10);
    //设置代理
    scrollView.delegate = self;
    //方向锁定
    scrollView.directionalLockEnabled = YES;
    //设置提示线的风格
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    //设置scrollView的缩放比
    ///scrollView.minimumZoomScale = 0.5;
    //scrollView.maximumZoomScale = 2.0;
    [scrollView addSubview:label1];
    [self.view addSubview:scrollView];
    
}

int n = 1;
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return  label1;
}
//在滚动中会一直调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = MIN(1, offsetY / 200.0); // 渐变效应的偏移值可以调整
        
    UIColor *color = [UIColor colorWithWhite:1 alpha:alpha];
    [self.navigationController.navigationBar setBackgroundColor:color];
    //NSLog(@"%d页面正在滚动",n++);
    
}

////用户即将开始拖动时，调用，仅调用一次
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
    NSLog(@"*********页面准备滚动********");
}
- (CGPoint)nearestTargetOffsetForOffset:(CGPoint)offset
{
    CGFloat pageSize = 300;
    NSInteger page = roundf(offset.x / pageSize);
    CGFloat targetY = pageSize * page;
    page = roundf(offset.y / pageSize);
    CGFloat targetX = pageSize * page;
    return CGPointMake(targetX, targetY);
}

// 用户即将停止拖动时调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGPoint targetOffset = [self nearestTargetOffsetForOffset:*targetContentOffset];
        targetContentOffset->x = targetOffset.x;
        targetContentOffset->y = targetOffset.y;
    NSLog(@"%f,%f",targetContentOffset->x,targetContentOffset->y);
    NSLog(@"__________页面即将停止滚动_________");
}
//用户已经停止拖动时调用，分两种情况，一种是用户抬手即停止，此时decelereate为NO也不会调用Decelerate相关的方法，一种是用户让其有惯性的向下滑，此时会调用decelerate相关的方法 (decelerate 指定是否有减速动作 Dragging 拖)
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(decelerate == NO) {
        NSLog(@".........已停止滚动..........");
    }else {
        NSLog(@"`````````已停止滚动，但惯性在减速`````````");
    }
    
}
//返回是否允许点击状态栏返回顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}
//仅当是因为点击状态栏而返回顶部的行为时才会调用
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"<<<<<<<<<<<<已经返回顶部>>>>>>>>>>>>");
}

//已经停止减速时调用（仅当停止拖拽后继续移动才会调用）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"xxxxxxxxxxx已停止减速xxxxxxxxxxxxx");
}
//开始减速时调用（仅当停止拖拽后继续移动才会调用）
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"xxxxxxxxxxx开始减速xxxxxxxxxxxxx");
}
@end
