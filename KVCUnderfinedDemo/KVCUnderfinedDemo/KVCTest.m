//
//  KVCTest.m
//  KVCUnderfinedDemo
//
//  Created by Theo on 2024/7/5.
//

#import "KVCTest.h"
#import <objc/runtime.h>
@implementation KVCTest
-(id)valueForUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"newProperty"])
    {
        if(objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key)))
        {
            return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(key));
            
        }else{
            return  @"This is a new property";
        }
        
        
        
    }else{
        return [super valueForUndefinedKey:key];
    }
}
-(void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key{
    if([key isEqualToString:@"newProperty"]){
        NSLog(@"%@", @"ur setting undefined property");
        objc_setAssociatedObject(self, CFBridgingRetain(key), value, OBJC_ASSOCIATION_RETAIN);
    }else{
        [super setValue:value forUndefinedKey:key];
    }
}
@end
