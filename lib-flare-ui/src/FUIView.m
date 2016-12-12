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
                subviews = [FUIArray init];
                backgroundColor = FUIColorBlack;
        }
        return self;
}

- (void)setBackgroundColor:(FUIColor)aColor {
        backgroundColor = aColor;
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
        SDL_RenderFillRect(renderer, &rect);
}

@end