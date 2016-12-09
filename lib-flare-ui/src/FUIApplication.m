#import "FUIApplication.h"

@interface FUIApplication () 

@end

@implementation FUIApplication

- (FUIWindow *)createWindow:(FUIRect)aRect {
        FUIWindow *window = [[FUIWindow alloc] initWithFrame:aRect];
        [windows addObject:window];
        return [window autorelease];
}

- (void)destroyWindow:(FUIWindow *)aWindow {
        FUIWindow *w = [windows removeObject:aWindow];

        if (!w) {
                fprintf(stderr, "Removing non existing object from FUIArray");
        }
}

- (instancetype)init {
        self = [super init];
        if (self) {
                if (SDL_Init(SDL_INIT_VIDEO) < 0) {
                        printf("SDL not initialized:\n\t%s", SDL_GetError());
                        return nil;
                }

                windows = [[FUIArray alloc] init];
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

                if ([windows count] == 0)
                        goto exitloop;

                for (size_t i = 0; i < [windows count]; i++) {
                        FUIWindow *w = [windows objectAtIndex:i];
                        [w render];
                }
        }

        exitloop:
        SDL_Quit();
}

@end