#import <MulleObjc/MulleObjc.h>
#import <SDL2/SDL.h>
#import "FUIRect.h"
#import "FUIArray.h"

@interface FUIView : NSObject {
        FUIArray *subviews;
        FUIRect frame;
}

- (instancetype)initWithFrame:(FUIRect)aRect;
- (void)render;

@end