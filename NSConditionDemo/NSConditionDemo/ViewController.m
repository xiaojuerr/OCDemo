//
//  ViewController.m
//  NSConditionDemo
//
//  Created by Theo on 2024/7/4.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic , strong) NSCondition *con;
@property (nonatomic , strong) NSMutableArray *data;
@end

@implementation ViewController
-(void)producer
{
    while(1){
        [_con lock];
        [_data addObject:@"Data"];
        NSLog(@"produced data");
        [_con signal];
        [_con unlock];
        [NSThread sleepForTimeInterval:1.0];
    }
}
-(void)consumer
{
    while(1){
        [_con lock];
        if(_data.count == 0){
            [_con wait];
        }
        [_data removeLastObject];
        NSLog(@"consumed data");
        [_con unlock];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _con = [NSCondition new];
    _data = [NSMutableArray array];
    
    NSThread *p = [[NSThread new]initWithTarget:self selector:@selector(producer) object:nil];
    [p start];
    NSThread *c =[[NSThread new]initWithTarget:self selector:@selector(consumer) object:nil];
    [c start];
    [[NSRunLoop currentRunLoop] run];
    // Do any additional setup after loading the view.
}


@end
