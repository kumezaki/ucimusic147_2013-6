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
    UInt32 numEvents;
    Float64 loopLength;
}

@property (readwrite) Float64 scoreTime;
@property (readwrite) Float64 bpm;
@property (readwrite) BOOL    on;
@property (readwrite) Float64 loopLength;


-(id)init;
-(void)advanceScoreTime:(Float64)elapsed_seconds;

-(void)play;
-(void)stop;
-(void)rewind;

@end
