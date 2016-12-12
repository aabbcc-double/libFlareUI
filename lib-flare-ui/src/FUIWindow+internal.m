#import "FUIWindow+internal.h"

@implementation FUIWindow (internal)

- (SDL_Renderer *)internal_getSDLRenderer {
        return sdlRenderer;
}

- (SDL_Window *)internal_getSDLWindow {
        return sdlWindow;
}
 
@end