#import "FUIArray.h"

@implementation FUIArray

- (instancetype)init {
        return [self initWithCapacity:10]; 
}

- (instancetype)initWithCapacity:(size_t)aCapacity {
        self = [super init];
        if (self) {
                elements = malloc(aCapacity);
                if (!elements) {
                        // TODO: safer error handling
                        fprintf(stderr, "[FATAL]: Could not allocate memory");
                        exit(-1);
                }

                elem_count = 0;
                capacity = aCapacity;
        }
        return self;
}

- (void)addObject:(id)object {
        [object retain];
        elem_count++;

        if (elem_count > capacity) {
                id* new_elems = realloc(elements, capacity + 10);
                if (!new_elems) {
                        // TODO: safer error handling
                        fprintf(stderr, "[FATAL]: Could not reallocate array");
                        exit(-1);
                }
                elements = new_elems;
                capacity += 10;
        }

        elements[elem_count - 1] = object;
}

- (id)objectAtIndex:(size_t)index {
        if (index >= elem_count) {
                // TODO: Raise exception
                fprintf(stderr, "[WARNING]: Accessing elements beyond array");
                return nil;
        }

        id object = elements[index];
        return object;
}

- (id)removeObjectAtIndex:(size_t)index {
        if (index >= elem_count) {
                // TODO: Raise exception
                fprintf(stderr, "[WARNING]: Accessing elements beyond array");
                return nil;
        }

        id object = elements[index];

        // shift values
        for (size_t i = index + 1; i < elem_count; i++) {
                id o = elements[i];
                elements[i - 1] = o;
        }
        elem_count--;

        return [object autorelease];
}

- (size_t)count {
        return elem_count;
}

@end