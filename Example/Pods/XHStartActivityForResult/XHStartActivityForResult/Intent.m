//
//  Intent.m
//  StartActivityForResult
//
//  Created by 刘晓恒 on 2018/5/22.
//  Copyright © 2018年 刘晓恒. All rights reserved.
//

#import "Intent.h"

@interface Intent ()

@property (nonatomic, strong) NSMutableDictionary *extra;

@end

@implementation Intent

- (instancetype)init {
    if (self = [super init]) {
        _extra = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)putExtra:(NSString *)key value:(id)val {
    [_extra setObject:val forKey:key];
}

- (id)getExtra:(NSString *)key {
    return _extra[key];
}

- (NSString *)description {
    NSMutableString *ret = [[NSMutableString alloc] initWithFormat:@"%@ {\n", NSStringFromClass([self class])];
    NSUInteger count = _extra.count;
    [_extra.allKeys enumerateObjectsUsingBlock:^(NSString  *_Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        [ret appendFormat:@"\t%@:\t \"%@\"", key, self->_extra[key]];
        if (idx != count - 1) {
            [ret appendString:@",\n"];
        } else {
            [ret appendString:@"\n}"];
        }
    }];
    
    return [ret copy];
}


@end
