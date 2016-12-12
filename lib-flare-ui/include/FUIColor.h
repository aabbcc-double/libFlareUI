#import <stdint.h>

typedef uint32_t FUIColor;
typedef uint8_t FUIColorComponent;

static inline FUIColor FUIColorCreate(FUIColorComponent alpha, FUIColorComponent red, FUIColorComponent green, FUIColorComponent blue) {
        FUIColor color = alpha;
        color = (color << 8) + red;
        color = (color << 8) + green;
        color = (color << 8) + blue;
        return color;
}

static inline FUIColorComponent FUIColorGetAlphaComponent(FUIColor color) {
        return (color & 0xFF000000) >> 24;
}

static inline FUIColorComponent FUIColorGetRedComponent(FUIColor color) {
        return (color & 0x00FF0000) >> 16;
}

static inline FUIColorComponent FUIColorGetGreenComponent(FUIColor color) {
        return (color & 0x0000FF00) >> 8;
}

static inline FUIColorComponent FUIColorGetBlueComponent(FUIColor color) {
        return (color & 0x000000FF);
}

static const FUIColor FUIColorBlack = 0xFF000000;
static const FUIColor FUIColorRed = 0xFFFF0000;
static const FUIColor FUIColorGreen = 0xFF00FF00;
static const FUIColor FUIColorBlue = 0xFF0000FF;