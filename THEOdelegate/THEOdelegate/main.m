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
        liu.name = @"mike";
        [liu talk];
        [liu call];
        [liu salary];
    }
    return 0;
}
