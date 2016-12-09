#import <MulleObjc/MulleObjc.h>

// Mutable
@interface FUIArray : NSObject {
        id* elements;
        size_t elem_count;
        size_t capacity;
}

- (instancetype)initWithCapacity:(size_t)aCapacity;
- (size_t)count;

- (void)addObject:(id)object;
- (id)objectAtIndex:(size_t)index;
- (id)removeObjectAtIndex:(size_t)index;
- (id)removeObject:(id)aObject;

@end
