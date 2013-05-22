//
//  MUS147Sequencer.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/19/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Sequencer.h"

@implementation MUS147Sequencer
@synthesize scoreTime;
@synthesize bpm;
@synthesize on;
@synthesize loopLength;

-(id)init
{
    self = [super init];
    
    seq =  [[MUS147Sequence alloc]init];
    scoreTime = 0.;
    loopLength = 4.;
    bpm = 120.;
    playing = NO;
    return self;
}

-(void)advanceScoreTime:(Float64)elapsed_seconds
{
    if (!playing) return;
    
    Float64 elapsed_beats = bpm / 60. * elapsed_seconds;
    scoreTime += elapsed_beats;
    
    for (UInt32 i = 0; i < seq.numEvents; i++)
    {
        MUS147Event* event = [seq getEvent:i];

            if (scoreTime < event.startTime)
            {
                // WAIT
                if (event.on)
                    [event doOff];
            }
            else if (scoreTime >= event.startTime + event.duration)
            {
                // DONE
                if (event.on)
                    [event doOff];
            }
            else
            {
                // PLAYING
                if (!event.on)
                    [event doOn];
            }
        if (scoreTime > loopLength)
        {
            scoreTime = 0.;
        }
    }
}

-(void)play
{
    playing = YES;
}

-(void)stop
{
    for (UInt32 i = 0; i < seq.numEvents; i++)
    {
        MUS147Event* event = [seq getEvent:i];
        [event doOff];
    }
    playing = NO;
}
-(void)rewind
{
    scoreTime = 0.;
}

@end
