//
//  main.m
//  NSTreadTest
//
//  Created by Theo on 2024/7/5.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@",[NSThread currentThread]);
        const char *label = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL);
        if (label) {
            NSLog(@"Current queue label: %s", label);
        } else {
            NSLog(@"Current queue is not a dispatch queue");
        }
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%@",[NSThread currentThread]);
            const char *label = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL);
            if (label) {
                NSLog(@"Current queue label: %s", label);
            } else {
                NSLog(@"Current queue is not a dispatch queue");
            }
        });
    }
    return 0;
}
