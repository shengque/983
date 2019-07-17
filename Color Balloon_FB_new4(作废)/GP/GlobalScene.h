//
//  GameScene.h
//  GP
//

//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "GlobalSettings.h"

#import "SimpleLabel.h"
#import "SimpleNode.h"
#import "ButtonNode.h"

#import "Sound.h"

@interface GlobalScene : SKScene {
    Sound *sound;
}

- (void)initSound;

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber;

- (void)makeScreenShot;
- (void)changeSceneToSceneName:(NSString *)nameScene andAnimationName:(NSString *)nameAnimation;

@end
