//
//  main.m
//  THEOCategory
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "THEOString.h"
#import "NSString+show.h"
#import "NSString+trim.h"
int main(int argc, const char * argv[]) {
    //继承
    @autoreleasepool {
//        THEOString *ts = [[THEOString alloc]init];
//        [ts show];
        //Category
        NSString *str = [NSString new];
        str = @"  123  ";
        NSLog(@"%@",str);
        str = [str trim];
        NSLog(@"%@",str);
            }
    return 0;
}
