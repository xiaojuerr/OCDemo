//
//  main.m
//  BlockDemo
//
//  Created by Theo on 2024/7/1.
//

#import <Foundation/Foundation.h>
#import "THEOArray.h"
typedef BOOL (^BlockCompare)(char *,char *);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BlockCompare comp1 = ^(char *c1,char *c2){
            int res = strcmp(c1, c2);
            if(res > 0) return YES;
            else return NO;
        };
        char *countries[] =
        {
            "China",
            "Singapore",
            "India",
            "Laos",
            "Burma",
            "Mongolia",
            "Vitnam"
        };
        char *people[] = {
            "zhangsan",
            "lisi",
            "linda",
            "aike",
            "Candy",
        };
        THEOArray *arr = [THEOArray new];
        [arr sortWithCountries:countries andLength:sizeof(countries)/sizeof(char*) andCompareBlock:comp1];
        for(int i=0;i<sizeof(countries)/sizeof(char*);i++){
            NSLog(@"%s",countries[i]);
        }
        THEOArray *arr2 = [THEOArray new];
        [arr sortWithCountries:people andLength:sizeof(people)/sizeof(char *) andCompareBlock:^(char *c1,char *c2){
            if(strlen(c1) > strlen(c2)) return YES;
            else return NO;
        }];
        for(int i=0;i<sizeof(people)/sizeof(char*);i++){
            NSLog(@"%s",people[i]);
        }
    }
    
    return 0;
}
