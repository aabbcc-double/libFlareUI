#import "FUIWindow.h"

@implementation FUIWindow 

- (instancetype) initWithFrame:(FUIRect)aRect {
        self = [super initWithFrame:aRect];
        if (self) {
                sdlWindow = SDL_CreateWindow("", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, (int) aRect.width, (int) aRect.height, 0);
                if (!sdlWindow) {
                        fprintf(stderr, "Could not create SDL window:\n\t%s", SDL_GetError());
                        return nil;
                }

                sdlRenderer = SDL_CreateRenderer(sdlWindow, -1, SDL_RENDERER_PRESENTVSYNC);
                if (!sdlRenderer) {
                        fprintf(stderr, "Could not create SDL renderer:\n\t%s", SDL_GetError());
                        return nil;
                }
        }       
        return self; 
}

- (void)render {
        
}

@end