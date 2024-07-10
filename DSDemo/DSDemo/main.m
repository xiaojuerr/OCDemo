//
//  main.m
//  DSDemo
//
//  Created by Theo on 2024/7/4.
//

#import <Foundation/Foundation.h>

@interface Demo : NSObject
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation Demo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(1); // 初始化信号量为1
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)producerThread {
    while (true) {
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        // 生产者线程向数组中添加数据
        [self.data addObject:@"Data"];
        NSLog(@"Produced data");
        dispatch_semaphore_signal(self.semaphore);
        [NSThread sleepForTimeInterval:1]; // 线程休眠1秒
    }
}

- (void)consumerThread {
    while (true) {
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        if (self.data.count > 0) {
            // 消费者线程从数组中取出数据
            [self.data removeLastObject];
            NSLog(@"Consumed data");
        }
        dispatch_semaphore_signal(self.semaphore);
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Demo *demo = [[Demo alloc] init];

        NSThread *producerThread = [[NSThread alloc] initWithTarget:demo selector:@selector(producerThread) object:nil];
        [producerThread start];

        NSThread *consumerThread = [[NSThread alloc] initWithTarget:demo selector:@selector(consumerThread) object:nil];
        [consumerThread start];

        [[NSRunLoop currentRunLoop] run]; // 运行runloop，保持线程存活
    }
    return 0;
}

