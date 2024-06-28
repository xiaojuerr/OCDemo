//
//  main.m
//  inheritance
//
//  Created by Theo on 2024/6/27.
//

#import <Foundation/Foundation.h>
#import "THEOShape.h"
#import "THEOReactangle.h"
#import "THEOSquare.h"
#import "THEOCircle.h"
#import "THEOTriangle.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //THEOSquare *sq = [[THEOSquare alloc]initWithSide:10];
        id shape = [[THEOCircle alloc]initWithRad:3];
        SEL sel = @selector(area);//可以运行一个行为，一类行为的标识
        if([shape respondsToSelector:sel]){ //判断某个对象有没有相应的行为
            NSLog(@"YES");
            
        }else NSLog(@"NO");
        
        //NSLog(@"Square Area is %g",[shape area]);
    }
    return 0;
}
