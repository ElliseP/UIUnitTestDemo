//
//  PersonTest.m
//  UnitTest
//
//  Created by Ellise on 2017/1/31.
//  Copyright © 2017年 ellise. All rights reserved.
//

#import "PersonTest.h"

@implementation PersonTest

+ (instancetype)personWithDictionay:(NSDictionary *)dic{
    PersonTest * per = [[PersonTest alloc] init];
    [per setValuesForKeysWithDictionary:dic];
    
    if (per.age <= 0 || per.age >= 130) {
        per.age = 0;
    }
    
    return per;
}

+ (void)loadPersonAsync:(void (^)(PersonTest *))completion{
   dispatch_async(dispatch_get_global_queue(0, 0), ^{
       [NSThread sleepForTimeInterval:2.f];
       
       PersonTest * p = [PersonTest personWithDictionay:@{@"name":@"ellise",@"age":@20}];
       
       dispatch_async(dispatch_get_main_queue(), ^{
           if (completion != nil) {
               completion(p);
           }
       });
   });
}

@end
