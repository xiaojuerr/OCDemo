//
//  ViewController.m
//  MasonryDemo
//
//  Created by Theo on 2024/7/11.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] init];
    self.label.text = @"Test Label";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor redColor];
    [self.view addSubview:_label];
    
    self.button1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [_button1 setTitle:@"Button1" forState:(UIControlStateNormal)];
    [_button1 addTarget:self action:@selector((button1Tapped)) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_button1];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [self.button2 addTarget:self action:@selector(button2Tapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button2];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view.mas_top).offset(100);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.height.mas_equalTo(50);
        }];
        
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label.mas_bottom).offset(20);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.height.mas_equalTo(50);
        }];
        
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.button1.mas_bottom).offset(20);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
            make.height.mas_equalTo(50);
        }];
   
}
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}
-(void)button1Tapped
{
    NSLog(@"tapped1");
}
-(void)button2Tapped
{
    NSLog(@"tapped2");
}
@end
