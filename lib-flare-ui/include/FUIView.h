#import <MulleObjc/MulleObjc.h>
#import <SDL2/SDL.h>
#import "FUIRect.h"
#import "FUIArray.h"
#import "FUIColor.h"

@interface FUIView : NSObject {
        FUIArray *subviews;
        FUIView *superview;
        FUIRect frame;
        FUIColor backgroundColor;
}

- (instancetype)initWithFrame:(FUIRect)aRect;
- (FUIRect)frame;
- (FUIView *)superview;
- (void)setBackgroundColor:(FUIColor)aColor;
- (void)render;
- (void)addSubview:(FUIView *)aView;
- (void)removeFromSuperview;

@end