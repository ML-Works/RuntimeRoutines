//
//  RuntimeRoutinesTests.m
//  MachineLearningWorks
//
//  Copyright (c) 2016 Anton Bukov <k06aaa@gmail.com>
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  https://opensource.org/licenses/MIT
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <XCTest/XCTest.h>

#import <RuntimeRoutines/RuntimeRoutines.h>

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testClassesAss {
    __block NSInteger count = 0;
    RRClassEnumerateAll(^(Class klass) {
        XCTAssert([klass isSubclassOfClass:[NSObject class]], @"Class should be subclass of NSObject: %@", klass);
        count++;
    });
    XCTAssert(count > 1000, @"Number of classes: %@", @(count));
}

- (void)testClassesSome {
    __block NSInteger count = 0;
    RRClassEnumerateSubclasses([XCTestCase class], ^(Class klass) {
        XCTAssert([klass isSubclassOfClass:[XCTestCase class]], @"Class should be subclass of XCTestCase: %@", klass);
        count++;
    });
    XCTAssert(count > 1, @"Number of classes: %@", @(count));
}

- (void)testPerformance {
    [self measureBlock:^{
        RRClassEnumerateAll(^(Class klass){
            ;
        });
    }];
}

@end
