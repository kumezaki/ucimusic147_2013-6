//
//  MUS147Event_Note.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/18/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Event_Note.h"

#import "MUS147AQPlayer.h"
extern MUS147AQPlayer* aqp;

#import "MUS147ViewController.h"
extern MUS147ViewController* viewcon;

@implementation MUS147Event_Note

//@synthesize noteNum;
@synthesize amp;
@synthesize pos;

-(void)doOn
{
//    [super doOn];  // KU: no need to override super because you need to access 2 voices
    
    on = YES;

    MUS147Voice* v;
    
    v = [aqp getVoice:pos*2];
    v.amp = 1./6.;
    v.freq = [MUS147Event_Note noteNumToFreq:noteNum];
    
//    NSLog(@"%d %f %f",pos,v.amp,v.freq);

    v = [aqp getVoice:pos*2+1];
    v.amp = 1./6.;
    v.freq = [MUS147Event_Note noteNumToFreq:noteNum] * 2;
}

-(void)doOff
{
    on = NO;
    
    MUS147Voice* v;
    
    v = [aqp getVoice:pos*2];
    v.amp = 0.;
    
//    NSLog(@"%d %f %f",pos,v.amp,v.freq);

    v = [aqp getVoice:pos*2+1];
    v.amp = 0.;
    
    voice = nil;

//    [super doOff];  // KU: no need to override super because you need to access 2 voices
}

+(Float64)noteNumToFreq:(Float64)note_num
{
    return pow(2.,((Float64)note_num-69)/12.)*440.;
}

@end
