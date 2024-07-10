//
//  ViewController.m
//  LockDemo
//
//  Created by Theo on 2024/7/4.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic , assign) NSInteger ticketNum;
@property (nonatomic , strong) NSLock *lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ticketNum = 100;
    _lock = [NSLock new];
    
    
    NSThread *thread1 = [[NSThread new]initWithTarget:self selector:@selector(sellTicket) object:nil];
    [thread1 setName:[NSString stringWithFormat:@"A"]];
    [thread1 start];
    NSThread *thread2 = [[NSThread new]initWithTarget:self selector:@selector(sellTicket) object:nil];
    [thread2 setName:[NSString stringWithFormat:@"B"]];
    [thread2 start];
    // Do any additional setup after loading the view.
}

-(void)sellTicket
{
    while(true){
        [_lock lock];
        if(_ticketNum >0){
            _ticketNum--;
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"%@卖了，还剩%ld",[[NSThread currentThread] name],_ticketNum);
        }else{
            [NSThread exit];
        }
        [_lock unlock];
    }
}
@end
