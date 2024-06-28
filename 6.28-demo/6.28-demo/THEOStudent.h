//
//  THEOStudent.h
//  6.28-demo
//
//  Created by Theo on 2024/6/28.
//

#import "THEOPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface THEOStudent : THEOPerson
@property int StuID;
-(void)study;
-(void)talk;
-(void)walk;
@end

NS_ASSUME_NONNULL_END
