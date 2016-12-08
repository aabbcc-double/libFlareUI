#import <MulleObjC/MulleObjC.h>
#import <SDL2/SDL.h>

@interface FUIApplication : NSObject {
        SDL_Window *window;
        SDL_Surface *surface;
        SDL_Renderer *renderer;
}
- (instancetype)init;
- (void)createWindow:(const char *)title width:(int)width height:(int)height;
- (void)createWindow:(const char *)title width:(int)width height:(int)height x:(int)x y:(int) y;
- (void)start;

@end
