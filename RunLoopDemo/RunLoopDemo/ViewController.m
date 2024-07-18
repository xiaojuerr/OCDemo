//
//  ViewController.m
//  RunLoopDemo
//
//  Created by Theo on 2024/7/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _workerThread = [[NSThread alloc] initWithTarget:self selector:@selector(startRunLoop) object:nil];
    [_workerThread start];
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [btn setTitle:@"Start RunLoop" forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(50, 100, 200, 5);
    [btn addTarget:self action:@selector(startTimerOnWorkerThread) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
}

-(void)startRunLoop
{
    @autoreleasepool {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}
-(void)startTimerOnWorkerThread
{
    if(self.workerThread && !self.timer){
        [self performSelector:@selector(startTimer) onThread:_workerThread withObject:nil waitUntilDone:NO ];
    }
}
-(void)startTimer
{
    @autoreleasepool {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
}
int n=1;
-(void)test
{
    
    NSLog(@"this is %d",n++);
}
@end
