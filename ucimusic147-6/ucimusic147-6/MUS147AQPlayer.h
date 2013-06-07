//
//  MUS147AQPlayer.h
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

#import "MUS147Voice.h"
#import "MUS147Sequencer.h"

/* number of buffers used by system */
#define kNumberBuffers	3
#define kNumVoices      6

/* sample rate */
#define kSR				22050.
#define kNumVoices_Synth    4

@interface MUS147AQPlayer : NSObject {

	AudioQueueRef				queue;
	AudioQueueBufferRef			buffers[kNumberBuffers];
	AudioStreamBasicDescription	dataFormat;
    UInt8 synthVoice;

    UInt8 synthVoiceType; // 0 for BLIT, 1 for BLITSaw

    MUS147Voice* voice[kNumVoices];
    MUS147Sequencer* sequencer;


}

@property (readonly) MUS147Sequencer* sequencer;

-(void)setup;

-(OSStatus)start;
-(OSStatus)stop;

-(MUS147Voice*)getVoice:(UInt8)pos;
-(MUS147Voice*)getSynthVoice;
-(MUS147Voice*)getSynthVoiceWithPos:(UInt8)pos;


-(void)fillAudioBuffer:(Float64*)buffer :(UInt32)num_samples;

-(void)reportElapsedFrames:(UInt32)num_frames;


@end
