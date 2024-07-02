//
//  main.m
//  manageMemory
//
//  Created by Theo on 2024/7/1.
//

#import <Foundation/Foundation.h>
#import "THEO Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *_name = @"zhangsan";//Count = 1
        THEO_Student *a =[THEO_Student new];
        THEO_Student *b =[THEO_Student new];
        [a setName:_name];//Count = 2
        [b setName:_name];//Count = 3
    }
    return 0;
}
