//
//  main.m
//  THEOProtocol
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        student *zs = [student new];
        zs.name = @"mike";
        [zs say];
        [zs song];
        [zs walk];
    }
    return 0;
}
