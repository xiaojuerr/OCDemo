//
//  THEORectangle.h
//  hello
//
//  Created by Theo on 2024/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface THEORectangle : NSObject
{
    int width;
    int weight;
}
-(void)setWidth:(int)_width;
-(void)setWeight:(int)_weight;
-(void)setWidth:(int)_width andWeight:(int)_weight;
-(int)width;
-(int)weight;
-(int)area;
+(id)rectangle;//1.类的行为，工厂行为，一般用于创建这个类自己的对象。2.全局可见。
@end

NS_ASSUME_NONNULL_END
