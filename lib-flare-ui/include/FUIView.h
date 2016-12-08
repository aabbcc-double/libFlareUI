#import <MulleObjc/MulleObjc.h>
#import <SDL2/SDL.h>
#import "FUIRect.h"

@interface FUIView : NSObject {
        // TODO: Create array class
        FUIView * subviews;
        uint32_t subviewsCount; 
        FUIRect frame;
}

- (instancetype)initWithFrame:(FUIRect)aRect;

@end