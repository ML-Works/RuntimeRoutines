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
    __block NSInteger metaCount = 0;
    
    RRClassEnumerateAllClasses(YES, ^(Class klass) {
        BOOL isSubclass = [klass isSubclassOfClass:[NSObject class]];
        BOOL isMetaclass = class_isMetaClass(klass);
        XCTAssert(isSubclass || isMetaclass, @"Class should be subclass of NSObject or be metaclass: %@", klass);
        if (isSubclass) {
            count++;
        }
        if (isMetaclass) {
            metaCount++;
        }
    });
    
    XCTAssert(count > 1000, @"Number of classes: %@", @(count));
    XCTAssert(metaCount > 1000, @"Number of metaclasses: %@", @(metaCount));
}

- (void)testClassesSome {
    __block NSInteger count = 0;
    __block NSInteger metaCount = 0;
    
    RRClassEnumerateSubclasses([XCTestCase class], YES, ^(Class klass) {
        BOOL isSubclass = [klass isSubclassOfClass:[XCTestCase class]];
        BOOL isMetaclass = class_isMetaClass(klass);
        XCTAssert(isSubclass || isMetaclass, @"Class should be subclass of XCTestCase or be metaclass: %@", klass);
        if (isSubclass) {
            count++;
        }
        if (isMetaclass) {
            metaCount++;
        }
    });
    
    XCTAssert(count > 1, @"Number of classes: %@", @(count));
    XCTAssert(metaCount > 1, @"Number of metaclasses: %@", @(metaCount));
    XCTAssert(count == metaCount);
}

- (void)testPerformance {
    [self measureBlock:^{
        RRClassEnumerateAllClasses(YES, ^(Class klass){
            ;
        });
    }];
}

@end
