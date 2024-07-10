//
//  ViewController.m
//  NSOperationDemo
//
//  Created by Theo on 2024/7/4.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong , nonatomic) NSOperationQueue *queue;
@end

@implementation ViewController
-(NSOperationQueue *)queue{
    if(_queue == nil){
        _queue = [NSOperationQueue new];
    }
    return _queue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self demo2];
    
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(demo) object:nil];
//    //[op start];
//    NSOperationQueue *queue = [NSOperationQueue new];
//    [queue addOperation:op];
    NSBlockOperation *op1  = [NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<4;i++){
            NSLog(@"A hello");
        }
        
    }];
    NSBlockOperation *op2  = [NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<4;i++){
            NSLog(@"B hello");
        }
    }];
    NSBlockOperation *op3  = [NSBlockOperation blockOperationWithBlock:^{
        for(int i=0;i<4;i++){
            NSLog(@"C hello");
        }
    }];
    [op1 addDependency:op2];
    
    _queue = [NSOperationQueue new];
    [_queue addOperation:op1];
    [_queue addOperation:op2];
    [_queue addOperation:op3];
    
}

-(void)demo
{
    NSLog(@"hello %@",[NSThread currentThread]);
    
}
-(void)demo2{
    [self.queue addOperationWithBlock:^{
        NSLog(@"2");
    }];
}
@end
