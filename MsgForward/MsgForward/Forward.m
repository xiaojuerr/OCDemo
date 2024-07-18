//
//  Forward.m
//  MsgForward
//
//  Created by Theo on 2024/7/16.
//

#import "Forward.h"
#import "Recieve.h"
@implementation Forward
{
    Recieve *receive;
}
-(instancetype) init
{
    self = [super init];
    if(self) {
        receive = [Recieve new];
    }
    return self;
}
//// 第一步：动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return NO;
}

// 第二步：快速转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

// 第三步：常规转发
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    // 获取实际处理对象的方法签名
    return [receive methodSignatureForSelector:@selector(processMessage:)];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // 重定向到实际处理对象
    if ([receive respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:receive];
    } else {
        [self doesNotRecognizeSelector:[anInvocation selector]];
    }
}
@end
