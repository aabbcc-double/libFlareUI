#import <stdio.h>
#import <MulleObjC/MulleObjC.h>
#import "FlareUI.h"
#import "minunit.h"

@interface App : FUIApplication 
@end

@implementation App


@end

MU_TEST(test_FUIArray) {
        FUIArray *array = [[FUIArray alloc] init];
        mu_assert([array count] == 0, "Empty array should have 0 count");
        [array release];
}

MU_TEST(test_FUIArray_ownership) {
        FUIArray *array = [[FUIArray alloc] init];

        NSObject *ob1, *ob2, *ob3;

        ob1 = [[NSObject alloc] init];
        mu_assert([ob1 retainCount] == 1, "Object should have only owner while initializing");

        [array addObject:ob1];
        mu_assert([ob1 retainCount] == 2, "Array should retain added object");
        [ob1 release];

        mu_assert([array count] == 1, "Array should have only the added element");
        @autoreleasepool {
                ob2 = [array objectAtIndex:0];
                mu_assert([ob2 retainCount] == 2, "Array should return with retain - autorelease mode");
        }
        mu_assert([ob2 retainCount] == 1, "Array should return with retain - autorelease mode");

        @autoreleasepool {
                ob3 = [array removeObjectAtIndex:0];
        }
        mu_assert([ob2 retainCount] == 0, "Array should release object"); 
}

MU_TEST_SUITE(test_suite_FUIArray) {
        MU_RUN_TEST(test_FUIArray);
        MU_RUN_TEST(test_FUIArray_ownership);
}

int main() {
        printf("Hello my dear library\n");
        printf("Version Major: %d\n", FLARE_UI_VERSION_MAJOR);
        printf("Version Minor: %d\n", FLARE_UI_VERSION_MINOR);
        printf("\n");

        MU_RUN_SUITE(test_suite_FUIArray);

        return 0;
}