#import <MulleObjc/MulleObjc.h>
#import <SDL2/SDL.h>
#import "FUIRect.h"
#import "FUIArray.h"
#import "FUIColor.h"

@interface FUIView : NSObject {
        FUIArray *subviews;
        FUIRect frame;
        FUIColor backgroundColor;
}

- (instancetype)initWithFrame:(FUIRect)aRect;
- (void)setBackgroundColor:(FUIColor)aColor;
- (void)render;

@end