//
//  main.m
//  KVCUnderfinedDemo
//
//  Created by Theo on 2024/7/5.
//

#import <Foundation/Foundation.h>
#import "KVCTest.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        KVCTest *t1 = [KVCTest new];
        [t1 setValue:@"Zhangsan" forKey:@"name"];
        NSLog(@"%@",[t1 valueForKey:@"name"]);
        NSLog(@"%@",[t1 valueForKey:@"newProperty"]);
        [t1 setValue:@"theo" forKey:@"newProperty"];
        NSLog(@"%@",[t1 valueForKey:@"newProperty"]);
    }
    return 0;
}
