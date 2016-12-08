#import <MulleObjC/MulleObjC.h>
#import <SDL2/SDL.h>
#import "FUIWindow.h"
#import "FUIArray.h"
#import "FUIRect.h"

@interface FUIApplication : NSObject {
        FUIArray *windows;
}
- (instancetype)init;
- (FUIWindow *)createWindow:(FUIRect)aRect;
- (void)start;

@end
