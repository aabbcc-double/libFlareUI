#import "FUIWindow.h"
FUIWindow *FUIWindow__currentRendering_FUIWindow = NULL;

@implementation FUIWindow 

- (instancetype) initWithFrame:(FUIRect)aRect {
        self = [super initWithFrame:aRect];
        if (self) {
                int x = aRect.x;
                int y = aRect.y;

                if (x < 0)
                        x = SDL_WINDOWPOS_CENTERED;
                if (y < 0)
                        y = SDL_WINDOWPOS_CENTERED;

                sdlWindow = SDL_CreateWindow("", x, y, (int) aRect.width, (int) aRect.height, 0);
                if (!sdlWindow) {
                        fprintf(stderr, "Could not create SDL window:\n\t%s", SDL_GetError());
                        return nil;
                }

                sdlRenderer = SDL_CreateRenderer(sdlWindow, -1, 0);
                if (!sdlRenderer) {
                        fprintf(stderr, "Could not create SDL renderer:\n\t%s", SDL_GetError());
                        return nil;
                }
        }       
        return self; 
}

- (void)render {
        FUIWindow__currentRendering_FUIWindow = self;

        FUIColorComponent r, g, b, a;

        r = FUIColorGetRedComponent(FUIColorBlack);
        g = FUIColorGetGreenComponent(FUIColorBlack);
        b = FUIColorGetBlueComponent(FUIColorBlack);
        a = FUIColorGetAlphaComponent(FUIColorBlack);

        SDL_SetRenderDrawColor(sdlRenderer, r, g, b, a);
        SDL_RenderClear(sdlRenderer);

        [super render];
        SDL_RenderPresent(sdlRenderer);
}

- (void)dealloc {
        SDL_DestroyRenderer(sdlRenderer);
        SDL_DestroyWindow(sdlWindow);

        [super dealloc];
}

@end

FUIWindow * const FUIWindowGetCurrentWindow() {
        return FUIWindow__currentRendering_FUIWindow;
}