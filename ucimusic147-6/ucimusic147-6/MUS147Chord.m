//
//  MUS147Chord.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/20/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Chord.h"
#import "MUS147AQPlayer.h"
#import "MUS147ViewController.h"

extern MUS147AQPlayer* aqp;
extern MUS147Chord* chrd;
extern MUS147ViewController* viewcon;

@implementation MUS147Chord

@synthesize numVoices;
@synthesize noteNum;
@synthesize freqNoteNum;
@synthesize value;

- (void)setAmpMax
{
    for (UInt32 i = 0; i < self.numVoices; i++)
    {
        [aqp getVoice:i].amp = 1./ self.numVoices;
    }
}

-(void)setAmpMasterVolSlider
{
    for (UInt32 i = 0; i < self.numVoices; i++)
    {
        [aqp getVoice:i].amp = 1. / self.numVoices;
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

-(void)freqGetNoteNum
{
    for (UInt32 i = 0; i < numVoices; i++){
    freqNoteNum = pow(2., ((Float64)noteNum - 69)/12.)*440;
    }
}




-(void)cMajorPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)60 - 69)/12.)*440;
    [aqp getVoice:1].freq = (pow(2., ((Float64)60 - 69)/12.)*440)*2.;
    [aqp getVoice:2].freq = pow(2., ((Float64)64 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)64 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = pow(2., ((Float64)67 - 69)/12.)*440;
    [aqp getVoice:5].freq = (pow(2., ((Float64)67 - 69)/12.)*440) * 2.;;
    self.numVoices = 6;
}


-(void)dMinorPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)62 - 69)/12.)*440;
    [aqp getVoice:1].freq = pow(2., ((Float64)65 - 69)/12.)*440;
    [aqp getVoice:2].freq = pow(2., ((Float64)69 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)62 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = (pow(2., ((Float64)65 - 69)/12.)*440) * 2.;
    [aqp getVoice:5].freq = (pow(2., ((Float64)69 - 69)/12.)*440) * 2.;
    self.numVoices = 6;
}

-(void)eMinorPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)64 - 69)/12.)*440;
    [aqp getVoice:1].freq = pow(2., ((Float64)67 - 69)/12.)*440;
    [aqp getVoice:2].freq = pow(2., ((Float64)71 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)64 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = (pow(2., ((Float64)67 - 69)/12.)*440) * 2.;
    [aqp getVoice:5].freq = (pow(2., ((Float64)71 - 69)/12.)*440) * 2.;
    self.numVoices = 6;
}


-(void)fMajorPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)65 - 69)/12.)*440;
    [aqp getVoice:1].freq = pow(2., ((Float64)69 - 69)/12.)*440;
    [aqp getVoice:2].freq = pow(2., ((Float64)72 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)65 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = (pow(2., ((Float64)69 - 69)/12.)*440) * 2.;
    [aqp getVoice:5].freq = (pow(2., ((Float64)72 - 69)/12.)*440) * 2.;
    self.numVoices = 6;
}


-(void)gMajorPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)67 - 69)/12.)*440;
    [aqp getVoice:1].freq = pow(2., ((Float64)71 - 69)/12.)*440;
    [aqp getVoice:2].freq = pow(2., ((Float64)74 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)67 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = (pow(2., ((Float64)71 - 69)/12.)*440) * 2.;
    [aqp getVoice:5].freq = (pow(2., ((Float64)74 - 69)/12.)*440) * 2.;
    self.numVoices = 6;
}

-(void)aMinorPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)69 - 69)/12.)*440;
    [aqp getVoice:1].freq = pow(2., ((Float64)72 - 69)/12.)*440;
    [aqp getVoice:2].freq = pow(2., ((Float64)76 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)69 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = (pow(2., ((Float64)72 - 69)/12.)*440) * 2.;
    [aqp getVoice:5].freq = (pow(2., ((Float64)76 - 69)/12.)*440) * 2.;
    self.numVoices = 6;
}


-(void)bFlatMajorPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)70 - 69)/12.)*440;
    [aqp getVoice:1].freq = pow(2., ((Float64)74 - 69)/12.)*440;
    [aqp getVoice:2].freq = pow(2., ((Float64)77 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)70 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = (pow(2., ((Float64)74 - 69)/12.)*440) * 2.;
    [aqp getVoice:5].freq = (pow(2., ((Float64)77 - 69)/12.)*440) * 2.;
    self.numVoices = 6;
}


-(void)bDimPlay
{
    [aqp getVoice:0].freq = pow(2., ((Float64)71 - 69)/12.)*440;
    [aqp getVoice:1].freq = pow(2., ((Float64)74 - 69)/12.)*440;
    [aqp getVoice:2].freq = pow(2., ((Float64)77 - 69)/12.)*440;
    [aqp getVoice:3].freq = (pow(2., ((Float64)71 - 69)/12.)*440) * 2.;
    [aqp getVoice:4].freq = (pow(2., ((Float64)74 - 69)/12.)*440) * 2.;
    [aqp getVoice:5].freq = (pow(2., ((Float64)77 - 69)/12.)*440) * 2.;

    self.numVoices = 6;
}


@end
