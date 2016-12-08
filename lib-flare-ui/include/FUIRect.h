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

static const FUIRect FUIRectZero = {.x = 0, .y = 0, .width = 0, .height = 0};