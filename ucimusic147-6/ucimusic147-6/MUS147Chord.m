//
//  MUS147Chord.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/20/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Chord.h"
#import "MUS147AQPlayer.h"
extern MUS147AQPlayer* aqp;

#import "MUS147Event_Note.h"

#import "MUS147Sequencer.h"

@implementation MUS147Chord

@synthesize numVoices;


- (void)setAmpMax
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 1./ numVoices;
    }
}

-(void)setAmpMasterVolSlider
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 1. / numVoices;
    }
}


- (void)resetSound
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
}



-(void)cMajorPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:60];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:60] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:64];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:64] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:67];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:67] * 2.;
    numVoices = 6;

    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:60 :64 :67];
}

- (void)cMajorStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:60 :64 :67];
}

-(void)dMinorPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:62];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:62] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:65];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:65] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:69];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:69] * 2.;

    numVoices = 6;

    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:62 :65 :69];

}

- (void)dMinorStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:62 :65 :69];
}

-(void)eMinorPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:64];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:64] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:67];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:67] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:71];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:71] * 2.;

    numVoices = 6;
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:64 :67 :71];

}


- (void)eMinorStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:64 :67 :71];
}

-(void)fMajorPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:65];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:65] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:69];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:69] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:72];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:72] * 2.;

    numVoices = 6;
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:65 :69 :72];
}

- (void)fMajorStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:65 :69 :72];
}

-(void)gMajorPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:67];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:67] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:71];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:71] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:74];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:74] * 2.;

    numVoices = 6;
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:67 :71 :74];

}

- (void)gMajorStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:67 :71 :74];
}

-(void)aMinorPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:69];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:69] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:72];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:72] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:76];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:76] * 2.;

    numVoices = 6;
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:69 :72 :76];

}

- (void)aMinorStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:69 :72 :76];
}


-(void)bFlatMajorPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:70];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:70] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:74];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:74] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:77];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:77] * 2.;

    numVoices = 6;
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:70 :74 :77];

}

- (void)bFlatMajorStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:70 :74 :77];
}

-(void)bDimPlay
{
    [aqp getVoice:0].freq = [MUS147Event_Note noteNumToFreq:71];
    [aqp getVoice:1].freq = [MUS147Event_Note noteNumToFreq:71] * 2.;
    [aqp getVoice:2].freq = [MUS147Event_Note noteNumToFreq:74];
    [aqp getVoice:3].freq = [MUS147Event_Note noteNumToFreq:74] * 2.;
    [aqp getVoice:4].freq = [MUS147Event_Note noteNumToFreq:77];
    [aqp getVoice:5].freq = [MUS147Event_Note noteNumToFreq:77] * 2.;

    numVoices = 6;
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOn:71 :74 :77];

}

- (void)bDimStop
{
    for (UInt32 i = 0; i < numVoices; i++)
    {
        [aqp getVoice:i].amp = 0;
        [aqp getVoice:i].freq = 0;
    }
    if (aqp.sequencer.recording)
        [aqp.sequencer addChordEventOff:71 :74 :77];
}


@end
