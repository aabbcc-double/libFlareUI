#import "FUIApplication.h"

@interface FUIApplication () 

@end

@implementation FUIApplication

- (void)createWindow:(const char *)title width:(int)width height:(int)height {
        [self createWindow:title width:width height:height x:SDL_WINDOWPOS_UNDEFINED y:SDL_WINDOWPOS_UNDEFINED];
}
- (void)createWindow:(const char *)title width:(int)width height:(int)height x:(int)x y:(int) y {
        window = SDL_CreateWindow(title, x, y, width, height, SDL_WINDOW_OPENGL);
        if (!window) {
                printf("Could not create window:\n\t:%s", SDL_GetError());
                return;
        }

        // surface = SDL_GetWindowSurface(window);
        // if (!surface) {
        //         printf("Could not create surface:\n\t:%s", SDL_GetError());
        //         return;
        // }

        renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_PRESENTVSYNC);
        if (!renderer) {
                printf("Count not create renderer:\n\t:%s", SDL_GetError());
                return;
        }
}

- (instancetype)init {
        self = [super init];
        if (self) {
                if (SDL_Init(SDL_INIT_VIDEO) < 0) {
                        printf("SDL not initialized:\n\t%s", SDL_GetError());
                        return nil;
                }
        }
        return self;
}



- (void)start {
        SDL_Event e;
        for (;;) {
                while( SDL_PollEvent( &e ) != 0 ) {
                        //User requests quit
                        if( e.type == SDL_QUIT ) {
                                goto exitloop;
                        }
                }

                SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
                SDL_RenderClear(renderer);

                SDL_RenderPresent(renderer);
        }

        exitloop:
        SDL_Quit();
}

@end