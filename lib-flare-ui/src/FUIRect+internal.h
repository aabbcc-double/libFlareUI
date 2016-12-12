#import "FUIRect.h"
#import <SDL2/SDL.h>

static inline SDL_Rect SDLRectFromFUIRect(FUIRect aRect) {
        SDL_Rect rect;
        rect.x = (int) aRect.x;
        rect.y = (int) aRect.y;
        rect.w = (int) aRect.width;
        rect.h = (int) aRect.height;
        return rect;
}