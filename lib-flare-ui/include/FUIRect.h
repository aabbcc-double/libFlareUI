#import "FUIFloat.h"

typedef struct {
        FUIFloat x;
        FUIFloat y;
        FUIFloat width;
        FUIFloat height;
} FUIRect;

static inline FUIRect FUIRectCreate(FUIFloat x, FUIFloat y, FUIFloat width, FUIFloat height) {
        FUIRect rect;
        rect.x = x;
        rect.y = y;
        rect.width = width;
        rect.height = height;
        return rect;
}

