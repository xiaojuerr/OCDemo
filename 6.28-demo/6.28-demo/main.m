//
//  main.m
//  6.28-demo
//
//  Created by Theo on 2024/6/28.
//

#import <Foundation/Foundation.h>
#import "THEOStudent.h"
#import "THEOMonitor.h"
#import "THEOTeacher.h"
#import "THEOTeacher+headmaster.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        THEOTeacher *zhang = [THEOTeacher new];
        zhang.name = @"ZhangSan";
        zhang.JobID = 1;
        [zhang beginClass];
        THEOMonitor *li = [THEOMonitor new];
        li.name = @"LiSi";
        li.StuID = 1;
        zhang.MinitorDel = li;
        [zhang.MinitorDel notice];
        THEOTeacher *master = [THEOTeacher new];
        master.name = @"Mike";
        master.JobID = 0;
        [master meetting];
    }
    return 0;
}