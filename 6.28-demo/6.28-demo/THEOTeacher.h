//
//  THEOTeacher.h
//  6.28-demo
//
//  Created by Theo on 2024/6/28.
//

#import "THEOPerson.h"
#import "THEOMonitor.h"
NS_ASSUME_NONNULL_BEGIN

@interface THEOTeacher : THEOPerson
@property int JobID;
@property THEOMonitor *MinitorDel;
-(void)beginClass;
@end

NS_ASSUME_NONNULL_END
