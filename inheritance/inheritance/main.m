//
//  main.m
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import <Foundation/Foundation.h>
#import "THEOShape.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        THEOShape *shape = [[THEOShape alloc]initWithWigth:20 andWithHeight:20];
        NSLog(@"area is %d",[shape area]);
    }
    return 0;
}
