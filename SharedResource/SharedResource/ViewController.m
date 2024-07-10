//
//  ViewController.m
//  SharedResource
//
//  Created by Theo on 2024/7/4.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic ,assign) int ticketaCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _ticketaCount = 20;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSThread *thread1 = [[NSThread new] initWithTarget:self selector:@selector(sellTickets) object:nil];
    [thread1 start];
    
    NSThread *thread2 = [[NSThread new] initWithTarget:self selector:@selector(sellTickets) object:nil];
    [thread2 start];
}
-(void)sellTickets
{
    while(YES)
    {
        [NSThread sleepForTimeInterval:1.0];
        if(_ticketaCount > 0){
            //任意一个对象内部都有一把锁
            @synchronized (self) {
                _ticketaCount --;
            }
            NSLog(@"remian %d",_ticketaCount);
        }
        else{
            NSLog(@"overed");
            break;
        }
    }
}

@end
