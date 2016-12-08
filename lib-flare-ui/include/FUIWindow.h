#import <MulleObjc/MulleObjc.h>
#import <SDL2/SDL.h>
#import "FUIView.h"

@interface FUIWindow : FUIView {
        SDL_Window *sdlWindow;
        SDL_Renderer *sdlRenderer;
}

@end