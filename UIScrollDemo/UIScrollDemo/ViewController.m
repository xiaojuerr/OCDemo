//
//  ViewController.m
//  UIScrollDemo
//
//  Created by Theo on 2024/7/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建一个滚动view对象
    [self.view setBackgroundColor:[UIColor grayColor]];
    UIScrollView *sv = [[UIScrollView alloc]initWithFrame:CGRectMake(60, 60, 200, 200)];
    [sv setBackgroundColor:[UIColor grayColor]];
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 190, 190)];
    [v1 setBackgroundColor:[UIColor redColor]];
    [sv addSubview:v1];
    UIView *v2 = [[UIView alloc]initWithFrame:CGRectMake(205, 5, 190, 190)];
    [v2 setBackgroundColor:[UIColor greenColor]];
    [sv addSubview:v2];
    
    UIView *v3 = [[UIView alloc]initWithFrame:CGRectMake(405, 5, 190, 190)];
    [v3 setBackgroundColor:[UIColor blueColor]];
    [sv addSubview:v3];
    //允许以页的方式进行滚动
    sv.pagingEnabled = YES;
    //设定滚动的范围
    sv.contentSize = CGSizeMake(600,200);
    //指定呈现的view
    sv.contentOffset = CGPointMake(200, 0);
    
    UIPageControl *pc = [[UIPageControl alloc]initWithFrame:CGRectMake(135, 220, 50, 37)];
    pc.pageIndicatorTintColor = [UIColor blackColor];
    pc.numberOfPages = 3;
    pc.currentPage = 1;
    [self.view addSubview:sv];
    [self.view addSubview:pc];
}


@end
