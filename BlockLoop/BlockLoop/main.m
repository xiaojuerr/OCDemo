//
//  main.m
//  BlockLoop
//
//  Created by Theo on 2024/7/2.
//



#import <Foundation/Foundation.h>

@interface MyClass : NSObject
@property (nonatomic, copy) void (^myBlock)(void);
@end

@implementation MyClass
- (void)dealloc {
    NSLog(@"MyClass instance is being deallocated");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        MyClass *obj = [[MyClass alloc] init];
        
        // 使用弱引用来避免循环引用
        __weak MyClass *weakObj = obj;
        obj.myBlock = ^{
            MyClass *strongObj = weakObj;
            if (strongObj) {
                NSLog(@"MyBlock is being executed");
            }
        };
        
        
        // 手动释放obj对象，模拟对象的生命周期管理
        obj = nil;
    }
    return 0;
}
