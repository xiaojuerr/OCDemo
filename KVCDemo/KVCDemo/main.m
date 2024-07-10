//
//  main.m
//  KVCDemo
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person *p = [Person new];
        //p.name = @"123";
        [p setValue:@"123" forKey:@"name"];
        NSLog(@"%@",[p valueForKey:@"name"]);
    }
    return 0;
}
