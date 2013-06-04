//
//  MUS147Sequencer.h
//  Music147_2013
//
//  Created by 三浦博行 on 5/19/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUS147Sequence.h"
@interface MUS147Sequencer : NSObject
{
    MUS147Sequence* seq;
    Float64 scoreTime;
    Float64 bpm;
    BOOL playing;
    BOOL recording;
    UInt32 numEvents;
    Float64 loopLength;
    Float64 noteOn[128];
}

@property (readwrite) Float64 scoreTime;
@property (readwrite) Float64 bpm;
@property (readwrite) BOOL    playing;
@property (readwrite) Float64 loopLength;
@property (readonly) BOOL recording;


-(id)init;
-(void)advanceScoreTime:(Float64)elapsed_seconds;

-(void)play;
-(void)stop;
-(void)rewind;

-(void)record;

-(void)allOnNotesOff;

-(void)addChordEvent:(UInt32)note_num;
-(void)addChordEventOn:(UInt32)note1 :(UInt32)note2 :(UInt32)note3;
-(void)addChordEventOff:(UInt32)note1 :(UInt32)note2 :(UInt32)note3;

-(void)addTouchEvent:(Float64)x :(Float64)y :(BOOL)on;

-(void)countIn;

@end
