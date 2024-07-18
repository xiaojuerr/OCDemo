//
//  Assistant.m
//  MsgForward
//
//  Created by Theo on 2024/7/16.
//

#import "Assistant.h"

@implementation Assistant
-(BOOL)respondsToSelector:(SEL)aSelector
{
    if(aSelector == @selector(call))
    {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(call)) {
            // 返回 Person 对象的 call 方法的签名
            return [[self.person class] instanceMethodSignatureForSelector:aSelector];
        }
        return [super methodSignatureForSelector:aSelector];
}

-(void)forwardInvocation:(NSInvocation *)anInvocation
{
    [anInvocation setTarget:self.person];
    
    [anInvocation invoke];
}
@end
