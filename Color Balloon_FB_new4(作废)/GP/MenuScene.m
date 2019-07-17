//
//  MenuScene.m
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import "MenuScene.h"
#import "AppDelegate.h"
#import "PrivacyViewController.h"

@implementation MenuScene

- (void)didMoveToView:(SKView *)view {
    //iAd
//    if (MS_SHOW_IAD) [[NSNotificationCenter defaultCenter] postNotificationName:@"showAd" object:nil];
//    else [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil];
    
    //Setting
    [self initSound];
    
    //Add node
    _background = [[SimpleNode alloc] initWithImageName:MS_IMG_NAME_BACKGROUND size:MS_SIZE_BACKGROUND position:MS_POSITION_BACKGROUND andZPosition:MS_ZPOSITION_BACKGROUND];
    _logo = [[SimpleNode alloc] initWithImageName:MS_IMG_NAME_LOGO size:MS_SIZE_LOGO position:MS_POSITION_LOGO andZPosition:MS_ZPOSITION_LOGO];
    _buttonStart = [[ButtonNode alloc] initWithSimpleImageName:MS_IMG_NAME_BUTTON_START_SIMPLE andPressedImage:MS_IMG_NAME_BUTTON_START_PRESSED size:MS_SIZE_BUTTON_START position:MS_POSITION_BUTTON_START andZPosition:MS_ZPOSITION_BUTTON_START];
    _buttonRateUs = [[ButtonNode alloc] initWithSimpleImageName:MS_IMG_NAME_BUTTON_RATEUS_SIMPLE andPressedImage:MS_IMG_NAME_BUTTON_RATEUS_PRESSED size:MS_SIZE_BUTTON_RATEUS position:MS_POSITION_BUTTON_RATEUS andZPosition:MS_ZPOSITION_BUTTON_RATEUS];
    _buttonGameCenter = [[ButtonNode alloc] initWithSimpleImageName:MS_IMG_NAME_BUTTON_GAME_CENTER_SIMPLE andPressedImage:MS_IMG_NAME_BUTTON_GAME_CENTER_PRESSED size:MS_SIZE_BUTTON_GAME_CENTER position:MS_POSITION_BUTTON_GAME_CENTER andZPosition:MS_ZPOSITION_BUTTON_GAME_CENTER];
    
    _labelScoreBest = [[SimpleLabel alloc] initWithText:[NSString stringWithFormat:@"%ld", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"bestScore"]] fontSize:MS_FONT_SIZE_LABEL_SCORE_BEST position:MS_POSITION_LABEL_SCORE_BEST colorByHEX:MS_FONT_COLOR_LABEL_SCORE_BEST andZPosition:MS_ZPOSITION_LABEL_SCORE_BEST];
    _labelScoreBestText = [[SimpleLabel alloc] initWithText:MS_TEXT_LABEL_SCORE_BEST_TEXT fontSize:MS_FONT_SIZE_LABEL_SCORE_BEST_TEXT position:MS_POSITION_LABEL_SCORE_BEST_TEXT colorByHEX:MS_FONT_COLOR_LABEL_SCORE_BEST_TEXT andZPosition:MS_ZPOSITION_LABEL_SCORE_BEST_TEXT];
    
    [self addChild:_background];
    [self addChild:_logo];
    [self addChild:_buttonStart];
    [self addChild:_buttonRateUs];
    [self addChild:_buttonGameCenter];
    
    [self addChild:_labelScoreBest];
    [self addChild:_labelScoreBestText];
    
    
   
    //Set font type
    _privacyLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    //Set different font size to any device
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ){
        _privacyLabel.fontSize = 20 ;
        _labelScoreBestText.fontSize = 20 ;
        _labelScoreBest.fontSize = 20 ;
        _buttonRateUs.position = CGPointMake(_buttonRateUs.position.x,250);
        _buttonGameCenter.position = CGPointMake(_buttonGameCenter.position.x,250);
        _buttonStart.position = CGPointMake(_buttonStart.position.x,350);
        _labelScoreBestText.position = CGPointMake(_labelScoreBestText.position.x,100);
        _labelScoreBest.position = CGPointMake(_labelScoreBest.position.x,_labelScoreBestText.position.y + 50);
    }
    else {
        _privacyLabel.fontSize = 20;
    }
    //Set font color
    _privacyLabel.fontColor = [UIColor purpleColor];
    //Set object positions
    _privacyLabel.zPosition = 30;
    _privacyLabel.position = CGPointMake(self.frame.size.width / 2, _labelScoreBest.position.y + 50);
    //Set label text
    _privacyLabel.text = [NSString stringWithFormat:@"Privacy"];
    //Add object to scene
    [self addChild:_privacyLabel];
}

#pragma mark --- Actions ---

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ([_buttonStart containsPoint:location]) [_buttonStart changeButtonStatePressed];
        if ([_buttonRateUs containsPoint:location]) [_buttonRateUs changeButtonStatePressed];
        if ([_buttonGameCenter containsPoint:location]) [_buttonGameCenter changeButtonStatePressed];
        
        if ([_privacyLabel containsPoint:location]) {
            AppDelegate* appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
            
            PrivacyViewController* viewController = [[PrivacyViewController alloc] init];
            UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:viewController];
            [appDelegate.window.rootViewController presentViewController:nav animated:YES completion:nil];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [_buttonStart changeButtonStateSimple];
    [_buttonRateUs changeButtonStateSimple];
    [_buttonGameCenter changeButtonStateSimple];
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ([_buttonStart containsPoint:location]) {
            [self changeSceneToSceneName:@"GameScene" andAnimationName:@"Nil"];
            [sound playSoundByName:@"buttonClick"];
        }
        if ([_buttonRateUs containsPoint:location]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"rateUs" object:nil];
            [sound playSoundByName:@"buttonClick"];
        }
        if ([_buttonGameCenter containsPoint:location]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"showLeaderboard" object:nil];
            [sound playSoundByName:@"buttonClick"];
        }
    }
}

@end
