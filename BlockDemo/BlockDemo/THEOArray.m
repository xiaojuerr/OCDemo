//
//  THEOArray.m
//  BlockDemo
//
//  Created by Theo on 2024/7/2.
//

#import "THEOArray.h"
typedef BOOL (^BlockCompare)(char *c1,char *c2);
@implementation THEOArray
-(void)sortWithCountries:(char *[])contries andLength:(int)len andCompareBlock:(BlockCompare) compareChar
{
    
    for(int i=0;i<len-1;i++){
        for(int j=0;j<len -1 -i;j++){
            BOOL res = compareChar(contries[j],contries[j+1]);
            if(res){
                char *temp = contries[j];
                contries[j] = contries[j+1];
                contries[j+1] = temp;
            }
        }
    }
}
@end
