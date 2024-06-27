//
//  TheoStudent.h
//  hello
//
//  Created by Theo on 2024/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheoStudent : NSObject
{
    //默认是保护权限
    NSString *name;
    int age;
}
//-（返回类型）函数名字：（参数的类型）参数的名字 标签：（参数的类型） 参数的名字......
-(void)say;
-(void)setName:(NSString *)_name;
-(void)setAge:(int)_age;
-(void)setName:(NSString *)_name andAge:(int)_age;
@end

NS_ASSUME_NONNULL_END
