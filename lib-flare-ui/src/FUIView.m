#import "FUIView.h"

@implementation FUIView

- (instancetype)initWithFrame:(FUIRect)aRect {
        self = [super init];
        if (self) {
                frame = aRect;
                subviews = 0;
        }
        return self;
}

@end