#import "FUIView.h"

@implementation FUIView

- (instancetype)init {
        return [self initWithFrame:FUIRectZero];
}

- (instancetype)initWithFrame:(FUIRect)aRect {
        self = [super init];
        if (self) {
                frame = aRect;
                subviews = [FUIArray init];
        }
        return self;
}

- (void)render {
        // TODO: render view recursively
}

@end