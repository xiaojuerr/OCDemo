//
//  main.m
//  KVO
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>
#import "Observer.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Observer *observer = [[Observer alloc] init];
                
                // 修改速度属性的值（触发KVO通知）
        observer.car.speed = 50;
    }
    return 0;
}
