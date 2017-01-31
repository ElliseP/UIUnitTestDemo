//
//  PersonTests.m
//  UnitTest
//
//  Created by Ellise on 2017/1/31.
//  Copyright © 2017年 ellise. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PersonTest.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerson{
    [self checkPersonWithDictionary:@{@"name":@"zhou", @"age":@20}];
}

- (void)testPersonAsync{
    XCTestExpectation *expectation = [self expectationWithDescription:@"异步加载"];
    [PersonTest loadPersonAsync:^(PersonTest *person) {
        XCTAssertNotNil(person.name,@"姓名不为空");
        XCTAssert(person.age>0,@"年龄超出范围");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

- (void)checkPersonWithDictionary:(NSDictionary *)dic{
    PersonTest * p = [PersonTest personWithDictionay:dic];
    NSLog(@"%@",p);
    
    NSString * name = dic[@"name"];
    NSInteger age = [dic[@"age"] integerValue];
    
    XCTAssert([name isEqualToString:p.name]||p.name == nil, @"姓名不一致");
    XCTAssert((age<130&&age>0)&&age==p.age,@"年龄不一致");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        NSTimeInterval interval = CACurrentMediaTime();
        
        for (NSInteger i = 0; i < 10000; i++) {
            [PersonTest personWithDictionay:@{@"name":@"zhang",@"age":@20}];
        }
        
        // 传统测试代码耗时方法
        NSLog(@"%lf",CACurrentMediaTime() - interval);
    }];
}

@end
