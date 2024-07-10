//
//  main.m
//  NSNotificationCenter
//
//  Created by Theo on 2024/7/3.
//

#import <Foundation/Foundation.h>
#import "Publisher.h"
#import "Subscriber1.h"
#import "Subscriber2.h"
#import "Publisher1.h"
#import "Subscriber3.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Publisher *ps = [Publisher new];
        Subscriber1 *sb = [Subscriber1 new];
        //[ps performSomeAction];
        //[sb stopObservingNotification];
        //[sb startObservingNotification];
        Subscriber2 *sb2 = [Subscriber2 new];
        [ps performSomeAction];
        NSDictionary *info = @{@"name1" : @"theo",@"name2" : @"mike"};
        Publisher1 *ps1 = [Publisher1 new];
        Subscriber3 *sb3 = [Subscriber3 new];
        [ps1 performYourAction:info];
        
    }
    return 0;
}
