//
//  GameScene.h
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "GlobalScene.h"

#import "GameSceneSettings.h"
#import "GameProgressSettings.h"

#import "PlayerNode.h"
#import "EnemyNode.h"

@interface GameScene : GlobalScene {
    int score;
    BOOL gameIsPlay;
    BOOL firstRun;
    
    float health;
    
    CGPoint positionToMovePlayer;
    
    NSMutableArray *arrayWithEnemysColors;
    
    UISwipeGestureRecognizer *recognizerLeft;
    UISwipeGestureRecognizer *recognizerRight;
    UISwipeGestureRecognizer *recognizerDown;
    UISwipeGestureRecognizer *recognizerUp;
    
    NSTimer *timeToGenerateEnemy;
    NSTimer *timeToChangeScene;
    NSTimer *timeToSetNewObjectToScene;
    NSTimer *timeToChangeHealth;
}

@property SimpleNode *background;

@property SimpleLabel *labelScore;

@property PlayerNode *player;

@property EnemyNode *enemyTop;
@property EnemyNode *enemyDown;
@property EnemyNode *enemyLeft;
@property EnemyNode *enemyRight;

@property SimpleNode *health;
@property SimpleNode *healthCover;

@end
