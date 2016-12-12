#import "FUIView.h"
#import "FUIWindow.h"
#import "FUIWindow+internal.h"
#import "FUIRect.h"
#import "FUIRect+internal.h"

@implementation FUIView

- (instancetype)init {
        return [self initWithFrame:FUIRectZero];
}

- (instancetype)initWithFrame:(FUIRect)aRect {
        self = [super init];
        if (self) {
                frame = aRect;
                subviews = [[FUIArray alloc] init];
                backgroundColor = FUIColorBlack;
        }
        return self;
}

- (void)setBackgroundColor:(FUIColor)aColor {
        backgroundColor = aColor;
}

- (void)removeFromSuperview {
        [superview removeView:self]; 
        superview = nil;
}

- (FUIRect)frame {
        return frame;
}

- (FUIView *)superview {
        return superview;
}

- (void)removeView:(FUIView *)aView {
        [subviews removeObject:aView];
}

- (void)setSuperview:(FUIView *)aView {
        superview = aView;
}

- (void)addSubview:(FUIView *)aView {
        [subviews addObject:aView];
        [aView setSuperview:self];
}

- (void)render {
        const FUIWindow * const window = FUIWindowGetCurrentWindow();
        SDL_Renderer *renderer = [window internal_getSDLRenderer];

        FUIColorComponent r, g, b, a;

        r = FUIColorGetRedComponent(backgroundColor);
        g = FUIColorGetGreenComponent(backgroundColor);
        b = FUIColorGetBlueComponent(backgroundColor);
        a = FUIColorGetAlphaComponent(backgroundColor);

        SDL_SetRenderDrawColor(renderer, r, g, b, a);

        SDL_Rect rect = SDLRectFromFUIRect(frame);
        if (superview == nil) { /* Rootview */
                rect.x = 0;
                rect.y = 0;
        } else {
                FUIView * view = self;
                while (!![view superview]) {
                        view = [view superview];
                        FUIRect superframe = [view frame];
                        rect.x += superframe.x;
                        rect.y += superframe.y;
                }
        } 

        SDL_RenderFillRect(renderer, &rect);

        for (size_t i = 0; i < [subviews count]; i++) {
                FUIView *view = [subviews objectAtIndex:i];
                [view render];
        }
}

@end