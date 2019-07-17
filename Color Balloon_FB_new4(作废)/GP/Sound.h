//
//  Sound.h
//  GP
//
//  Created by Vladimir Vinnik on 14.06.15.
//  Copyright (c) 2015 Vladimir Vinnik. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface Sound : NSObject <AVAudioRecorderDelegate, AVAudioPlayerDelegate> {
    SystemSoundID buttonClick;
    SystemSoundID endGame;
    SystemSoundID getPoint;
    
    AVAudioPlayer *audioPlayer;
}

- (void)playSoundByName:(NSString *)soundName;

@end
