//
//  ViewController.m
//  thread
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
    
    //方式1
//    NSThread *thread = [[NSThread new]initWithTarget:self selector:@selector(demo) object:nil];
//    [thread start];
    //方式2
    //[NSThread detachNewThreadSelector:@selector(demo) toTarget:self withObject:nil];
    //方式3
    //[self performSelectorInBackground:@selector(demo) withObject:nil];
    //方式4 参数
    NSThread *thread = [[NSThread new]initWithTarget:self selector:@selector(demo:) object:@"jack"];
    [thread start];
}
-(void)demo:(NSString *)name
{
    NSLog(@"%@",name);
}
//-(void)demo
//{
//    NSLog(@"I am %@",[NSThread currentThread]);
//}
@end
