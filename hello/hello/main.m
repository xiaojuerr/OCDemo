//
//  main.m
//  hello
//
//  Created by Theo on 2024/6/27.
//

#import <Foundation/Foundation.h>
#import "TheoStudent.h"
#import "TheoSum.h"
#import "THEORectangle.h"
//@interface申明类，数据&数据的方法,不需要实现
//@interface Student : NSObject{
//    NSString *name;
//    int age;
//    
//}
//-(void)say;
//@end
//
//@implementation Student
//-(void)say
//{
//    NSLog(@"我叫%@，我%d岁了！",name,age);
//}
//
//@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {//自动释放池
        // insert code here...
//        TheoStudent *zs = [[TheoStudent alloc]init];
//        [zs setName:@"Zhangsan" andAge:23];
//        //@用于区分和别的语言的区别，表示oc中的字符串
//        [zs say];
//        TheoSum *em = [[TheoSum alloc]init];
//        [em setN:100];
//        NSLog(@"sum:%d",[em sum]);
        
        THEORectangle *rect = [THEORectangle rectangle];
        rect.width = 100;//.操作符也是行为的调用，如果是对.赋值的话那么就是调用setWidth的行为,获得值的时候就是调用width方法
        rect.weight = 100;
        
        NSLog(@"%d",[rect area]);
    }
    return 0;
}
