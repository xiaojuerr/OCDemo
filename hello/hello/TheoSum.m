//
//  TheoSum.m
//  hello
//
//  Created by Theo on 2024/6/27.
//

#import "TheoSum.h"

@implementation TheoSum
-(void)setN:(int)_n
{
    n = _n;
}
-(int)sum{
    int s= 0;
    for(int i=1;i<=n;i++){
        s+=i;
    }
    return s;
}
@end
