#import <stdio.h>
#import <MulleObjC/MulleObjC.h>
#import "FlareUI.h"
#import "minunit.h"

@interface App : FUIApplication 
@end

@implementation App


@end

@interface BouncingView : FUIView {
        FUIPoint direction;
}

@end

@implementation BouncingView

- (instancetype)initWithFrame:(FUIRect)aRect {
        self = [super initWithFrame:aRect];
        if (self) {
                direction = FUIPointCreate(1, 1);
        }
        return self;
}

- (void)render {
        FUIRect superviewFrame = [superview frame];

        if (frame.x + frame.width > superviewFrame.width)
                direction.x = -1;
        if (frame.y + frame.height > superviewFrame.height)
                direction.y = -1;
        if (frame.x < 0)
                direction.x = 1;
        if (frame.y < 0)
                direction.y = 1;

        frame.x += direction.x;
        frame.y += direction.y;

        [super render];
}

@end

@interface GradientView : FUIView

@end

@implementation GradientView

- (void)render {
        FUIColorComponent red = FUIColorGetRedComponent(backgroundColor);
        red = (red + 1) % 255;
        backgroundColor = FUIColorCreate(0xFF, red, 0x00, 0x00);

        [super render];
}

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

MU_TEST(test_FUIColor) {
        FUIColor color;
        FUIColorComponent cc;

        color = FUIColorCreate(0x12, 0x34, 0x56, 0x78);
        mu_assert(color == 0x12345678, "Color isn't valid");

        cc = FUIColorGetAlphaComponent(color);
        mu_assert(cc == 0x12, "Alpha component isn't valid");

        cc = FUIColorGetRedComponent(color);
        mu_assert(cc == 0x34, "Red component isn't valid");

        cc = FUIColorGetGreenComponent(color);
        mu_assert(cc == 0x56, "Green component isn't valid");

        cc = FUIColorGetBlueComponent(color);
        mu_assert(cc == 0x78, "Blue component isn't valid");
}

int main() {
        printf("Hello my dear library\n");
        printf("Version Major: %d\n", FLARE_UI_VERSION_MAJOR);
        printf("Version Minor: %d\n", FLARE_UI_VERSION_MINOR);
        printf("\n");

        MU_RUN_SUITE(test_suite_FUIArray);
        MU_RUN_TEST(test_FUIColor);

        App *app = [[App alloc] init];
        FUIWindow *window = [app createWindow:FUIRectCreate(0, 0, 640, 480)];
        [window setBackgroundColor:FUIColorBlue];

        GradientView *view3 = [[GradientView alloc] initWithFrame:FUIRectCreate(250, 250, 250, 250)];
        [window addSubview:view3];
        [view3 release];
        
        FUIWindow *window2 = [app createWindow:FUIRectCreate(-1, -1, 640, 480)];
        [window2 setBackgroundColor:FUIColorRed];

        FUIView *view;
        view = [[FUIView alloc] initWithFrame:FUIRectCreate(100, 200, 100, 200)];
        [view setBackgroundColor:FUIColorBlue];
        [window2 addSubview:view];
        
        BouncingView *view2 = [[BouncingView alloc] initWithFrame:FUIRectCreate(10, 20, 10, 20)];
        [view2 setBackgroundColor:FUIColorGreen];
        [view addSubview:view2];

        [view release];
        [view2 release]; 

        FUIWindow *window3 = [app createWindow:FUIRectCreate(500, 400, 640, 480)];
        [window3 setBackgroundColor:FUIColorGreen];

        [app start];

        return 0;
}