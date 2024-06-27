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
        THEOShape *shape = [[THEOShape alloc]initWithWigth:20 andWithHeight:20];
        NSLog(@"area is %d",[shape area]);
        THEOReactangle *rect = [[THEOReactangle alloc]initWithWigth:20 andWithHeight:30];
        NSLog(@"Rect Area is %d",[rect area]);
        THEOSquare *sq = [[THEOSquare alloc]initWithSide:5];
        NSLog(@"Square Area is %d",[sq area]);
        THEOCircle *cir = [[THEOCircle alloc]initWithRad:10];
        NSLog(@"Circle Area is %.0lf",[cir area]);
        THEOTriangle *tri = [[THEOTriangle alloc]initWithBottom:5 ansWithHeight:5];
        NSLog(@"Triangle Area is %lf",[tri area]);
    }
    return 0;
}
