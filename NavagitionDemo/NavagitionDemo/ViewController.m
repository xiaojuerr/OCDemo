//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by Theo on 2024/7/8.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *zoomingImageView; // 用于缩放的图片视图

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithWhite:1 alpha:0]];
    self.navigationItem.title = @"ScrollView Demo";

    // 初始化 ScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    [self.view addSubview:self.scrollView];

    // 初始化背景图片
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)]; // 初始高度为200
    self.backgroundImageView.image = [UIImage imageNamed:@"1.png"];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImageView.clipsToBounds = YES; // 防止图片拉伸变形
    [self.scrollView addSubview:self.backgroundImageView];

    // 添加测试内容（位于图片下方）
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 200, 50)]; // 调整位置到图片下方
    label1.text = @"Test Label";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:label1];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    // 导航栏渐变
    CGFloat imageAlpha = MIN(1, MAX(0.5, 0.5 - offsetY / 400.0));
       self.backgroundImageView.alpha = imageAlpha;

    // 图片放大效果
    if (offsetY < 0) {
        CGFloat scaleFactor = 1 - offsetY / 300; // 控制放大比例
        self.backgroundImageView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    } else {
        self.backgroundImageView.transform = CGAffineTransformIdentity; // 还原大小
    }
}

@end
