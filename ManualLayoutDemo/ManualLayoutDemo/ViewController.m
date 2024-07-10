//
//  ViewController.m
//  ManualLayoutDemo
//
//  Created by Theo on 2024/7/10.
//

#import "ViewController.h"
#import "superView.h"
@interface ViewController ()
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    superView *sView = [superView new];
    sView.frame = CGRectMake(20, 20, 180, 180);
    [sView createSubView];
    sView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:sView];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(240,520,80,40);
    [btn1 setTitle:@"zoooming" forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(pressSmall) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(120, 520, 84, 40);
    [btn2 setTitle:@"scale" forState:(UIControlStateNormal)];
    [btn2 addTarget:self action:@selector(pressLarge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    sView.tag = 101;

}
-(void)pressSmall
{
    superView *sView = (superView*)[self.view viewWithTag:101];
    [UIView animateWithDuration:1 animations:^{
        sView.frame = CGRectMake(20, 20, 300, 480);
    }];
}
-(void)pressLarge
{
    superView *sView = (superView*)[self.view viewWithTag:101];
    [UIView animateWithDuration:1 animations:^{
        sView.frame = CGRectMake(20, 20, 180, 180);
    }];
}
@end
