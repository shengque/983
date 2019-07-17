//
//  SimpleNode.m
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "SimpleNode.h"

@implementation SimpleNode

- (id)initWithImageName:(NSString *)imageName size:(CGSize)size position:(CGPoint)position andZPosition:(int)zPosition {
    if (self = [super init]) {
        if (FILTERED_IMAGE_IN_ALL_PROGECT) self = [SimpleNode spriteNodeWithTexture:[self getUnfilteredTextureFromName:imageName]];
        else self = [SimpleNode spriteNodeWithImageNamed:imageName];
        self.size = size;
        self.position = position;
        self.zPosition = zPosition;
    }
    return self;
}

- (id)initWithHEXColor:(NSString *)colorHEX size:(CGSize)size position:(CGPoint)position andZPosition:(int)zPosition {
    if (self = [super init]) {
        self = [SimpleNode spriteNodeWithColor:[self getColorFromHexString:colorHEX] size:size];
        self.position = position;
        self.zPosition = zPosition;
    }
    return self;
}

@end
