//
//  PersonTest.h
//  UnitTest
//
//  Created by Ellise on 2017/1/31.
//  Copyright © 2017年 ellise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonTest : NSObject

@property (nonatomic,copy) NSString * name;

@property (nonatomic,assign) NSInteger age;

+ (instancetype)personWithDictionay:(NSDictionary *)dic;

+ (void)loadPersonAsync:(void(^)(PersonTest * person))completion;

@end
