//
//  main.m
//  MsgForward
//
//  Created by Theo on 2024/7/16.
//

#import <Foundation/Foundation.h>
#import "Forward.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Forward *forwarder = [[Forward alloc] init];
            // 尝试调用 forwarder 对象中没有实现的方法
            [forwarder performSelector:@selector(processMessage:) withObject:@"Hello, World!"];
    }
    return 0;
}
