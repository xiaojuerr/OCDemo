//
//  ViewController.m
//  UIButton
//
//  Created by Theo on 2024/7/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建button，并且设置一个风格
    
    UILabel *label = [[UILabel new]init];
    [label setText:@"this is a label"];
    //label.frame = CGRectMake(0, 40, 50, 50);
    [label setFrame:CGRectMake(200, 200, 200, 200)];
    label.backgroundColor = [UIColor redColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"light.jpeg"] forState:(UIControlStateNormal)];
    button.frame = CGRectMake(100, 100, 100, 100);
    //设置背景颜色
    button.backgroundColor = [UIColor greenColor];
    //设置标题
    [button setTitle:@"点击" forState:(UIControlStateNormal)];
    
    [button addTarget:self action:@selector(buttonTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
}
-(void)buttonTap:(id)sender{
    NSLog(@"tapped!");
}

@end
