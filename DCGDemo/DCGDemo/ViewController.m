//
//  ViewController.m
//  DCGDemo
//
//  Created by Theo on 2024/7/4.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//  dispatch_async(<#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
//  dispatch_sync(<#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_block_t task = ^{
//        NSLog(@"block");
//    };
//    dispatch_async(queue,task);
    //简化
    dispatch_async(dispatch_get_global_queue(0, 0),^{
                NSLog(@"block");
    });
}


@end
