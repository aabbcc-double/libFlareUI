#import "FUIFloat.h"

typedef struct {
        FUIFloat x;
        FUIFloat y;
} FUIPoint;

static inline FUIPoint FUIPointCreate(FUIFloat x, FUIFloat y) {
        FUIPoint point;
        point.x = x;
        point.y = y;
        return point;
} 