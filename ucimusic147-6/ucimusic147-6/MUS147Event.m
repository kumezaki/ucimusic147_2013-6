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
@synthesize noteNum;
@synthesize on;

-(void)doOn
{
    chrd = [[MUS147Chord alloc]init];
    chrd.numVoices = 1;
    voice = [aqp getVoice:0];
    voice.freq = [MUS147Event_Note noteNumToFreq:noteNum];
//    voice.amp = masterVolSlider.value/chrd.numVoices;
    voice.amp = 1/ chrd.numVoices;
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

