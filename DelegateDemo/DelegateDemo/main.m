//
//  main.m
//  DelegateDemo
//
//  Created by Theo on 2024/7/2.
//
//要求：
//1.洗衣
//2.做饭
//月薪过万的优先
//男孩子类：
//属性：姓名，年龄，工资，女朋友
//行为：谈恋爱
//
//协议：女朋友协议
//洗衣
//做饭
#import <Foundation/Foundation.h>
#import "Boy.h"
#import "Girl.h"
#import "Pig.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Boy *b1 = [Boy new];
        b1.name =  @"LiSi";
        b1.age = 18;
        b1.money = 10000;
        
        Girl *g1 = [Girl new];
        g1.name  = @"mike";
        b1.girlFriend = g1;
        [b1 talk];
        
        Pig *p1 = [Pig new];
        b1.girlFriend = p1;
        [b1 talk];
        
    }
    return 0;
}
