//
//  MUS147Event.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/19/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Event.h"
#import "MUS147AQPlayer.h"
#import "MUS147Chord.h"
#import "MUS147Event_Note.h"

extern MUS147AQPlayer* aqp;
extern MUS147Chord* chrd;

@implementation MUS147Event

@synthesize startTime;
@synthesize duration;
@synthesize touchDuration;
@synthesize noteNum;
@synthesize on;

-(void)doOn
{
//    for (UInt32 i = 0; i > seq.numEvents; i++) {
//        voice[i] = [aqp getVoice:i];
//        voice[i].freq = [MUS147Event_Note noteNumToFreq:noteNum];
//        voice[i].amp = 1/seq.numEvents;
//    }
    voice = [aqp getVoice:0];  // KU: this is where you're forcing all notes to play from only one voice and therefore monophonic playback only
    voice.freq = [MUS147Event_Note noteNumToFreq:noteNum];
    voice.amp = 1.;
    on = YES;
}

-(void)doOff
{
    voice.amp = 0.;
    on = NO;
    voice = nil;
    chrd.numVoices = 0;
}

@end

