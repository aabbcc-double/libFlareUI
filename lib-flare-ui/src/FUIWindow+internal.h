#import "FUIWindow.h"

@interface FUIWindow (internal)

- (SDL_Renderer *)internal_getSDLRenderer;
- (SDL_Window *)internal_getSDLWindow;

@end