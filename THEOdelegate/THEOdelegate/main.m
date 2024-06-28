//
//  main.m
//  THEOdelegate
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "THEOBoss.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        THEOBoss *liu = [THEOBoss new];
        THEOSec *zhang = [THEOSec new];
        liu.name = @"Mike";
        zhang.name = @"Linda";
        liu.sec = zhang;
        [liu.sec talk];
        [liu.sec call];
        [liu salary];
    }
    return 0;
}
