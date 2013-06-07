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
    on = YES;
    if (voice == nil)
        voice = [aqp getSynthVoice];
}

-(void)doOff
{
    on = NO;
    voice = nil;
}

@end

