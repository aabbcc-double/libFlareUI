#import <stdio.h>
#import <MulleObjC/MulleObjC.h>
#import "FlareUI.h"

@interface App : FUIApplication 
@end

@implementation App


@end

int main() {
        printf("Hello my dear library\n");
        printf("Version Major: %d\n", FLARE_UI_VERSION_MAJOR);
        printf("Version Minor: %d\n", FLARE_UI_VERSION_MINOR);
        printf("\n");

        App *app = [[App alloc] init]; 
        [app createWindow:"Hello world" width:640 height:480];
        [app start];
        [app release];

        return 0;
}