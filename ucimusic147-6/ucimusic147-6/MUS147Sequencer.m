//
//  MUS147Sequencer.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/19/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Sequencer.h"
#import "MUS147Event_Touch.h"
#import "MUS147Event_Note.h"

@implementation MUS147Sequencer
@synthesize scoreTime;
@synthesize bpm;
@synthesize playing;
@synthesize recording;

@synthesize loopLength;


-(id)init
{
    self = [super init];
    
    seq =  [[MUS147Sequence alloc]init];
    scoreTime = 0.;
    loopLength = 4.;
    bpm = 120.;
    playing = NO;

    for (UInt32 i = 0; i < 128; i++) {
        noteOn[i] = -1;
    }
    
    return self;
}

-(void)advanceScoreTime:(Float64)elapsed_seconds
{
    if (!playing && !recording) return;
    
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
        if (playing){
            if (scoreTime > loopLength)
            {
                scoreTime = 0.;
            }
        }

    }
}

//-(void)countIn
//{
//    for (UInt32 i = 2; i <= 5; i++)
//    {
//        MUS147Event* event = [seq getEvent:i];
//        [event doOn];
//    }
//
//    
//}


-(void)play
{
    playing = YES;
}

-(void)record
{
    //need count-in
    
    playing = NO;
    recording = YES;
    
    // reset the number of events in the sequence
    seq.numEvents = 0;
}

-(void)loopStop
{
    playing = NO;
}

-(void)stop
{
    if (!recording) {
        return;
    }
    recording = NO;
    loopLength = scoreTime;
    [self rewind];
//    [self allOnNotesOff];
}


-(void)rewind
{
    scoreTime = 0.;
}

-(void)allOnNotesOff
{
    for (UInt32 i = 0; i < seq.numEvents; i++)
    {
        MUS147Event* event = [seq getEvent:i];
        if (event.on)
            [event doOff];
    }
}

-(void)addChordEvent:(UInt32)note_num :(UInt8)note_pos
{
    MUS147Event_Note* e = [[MUS147Event_Note alloc] init];
    e.startTime = noteOn[note_num];
    e.duration = scoreTime - noteOn[note_num];
    e.noteNum = note_num;
    e.pos = note_pos; // KU: you'll use this get the proper voice
    [seq addEvent:e];
    noteOn[note_num] = -1.; // clear the noteOn array element
//    NSLog(@"%ld %f %f %f", note_num, e.startTime, e.duration, scoreTime);
    
}

-(void)addChordEventOn:(UInt32)note1 :(UInt32)note2 :(UInt32)note3
{
    if (!recording) return;
   
    noteOn[note1] = scoreTime;
    noteOn[note2] = scoreTime;
    noteOn[note3] = scoreTime;
//    NSLog(@"addChordEventon %f", scoreTime);
}

-(void)addChordEventOff:(UInt32)note1 :(UInt32)note2 :(UInt32)note3
{
    [self addChordEvent:note1 :0];
    [self addChordEvent:note2 :1];
    [self addChordEvent:note3 :2];
}

-(void)addTouchEvent:(Float64)x :(Float64)y :(BOOL)on
{
    if (!recording) return;
    
    if (seq.numEvents > 0)
    {
        MUS147Event* prev_e = [seq getEvent:(seq.numEvents-1)];
        prev_e.duration = scoreTime - prev_e.startTime;
        
        //      NSLog(@"%f %f %f %s PREV(%f,%f)",scoreTime,x,y,on?"YES":"NO",prev_e.startTime,prev_e.duration);
    }
    
    MUS147Event_Touch* e = [[MUS147Event_Touch alloc] init];
    e.startTime = scoreTime;
    e.duration = MAXFLOAT;
    e.x = x;
    e.y = y;
    e.type = on ? kMUS147Event_Touch_ON : kMUS147Event_Touch_OFF;
    
    [seq addEvent:e];
}

@end
