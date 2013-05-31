//
//  MUS147Sequence.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/19/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Sequence.h"
#import "MUS147Event.h"

@implementation MUS147Sequence
@synthesize numEvents;


-(id)init
{
    self = [super init];
    
    events[0] = [[MUS147Event alloc] init];
    events[0].startTime = 0.;
    events[0].duration = 1.;
    events[0].noteNum = 60;
    
    events[1] = [[MUS147Event alloc] init];
    events[1].startTime = 1.5;
    events[1].duration = 0.5;
    events[1].noteNum = 65;
   
    //count in
//    events[2] = [[MUS147Event alloc] init];
//    events[2].startTime = 0.;
//    events[2].duration = 0.2;
//    events[2].noteNum = 60;
//    
//    events[3] = [[MUS147Event alloc] init];
//    events[3].startTime = 1.;
//    events[3].duration = 0.2;
//    events[3].noteNum = 60;
//    
//    events[4] = [[MUS147Event alloc] init];
//    events[4].startTime = 2.;
//    events[4].duration = 0.2;
//    events[4].noteNum = 60;
//    
//    events[5] = [[MUS147Event alloc] init];
//    events[5].startTime = 3.;
//    events[5].duration = 0.2;
//    events[5].noteNum = 60;
    
    numEvents = 2;
    
    return self;

}

-(MUS147Event*)getEvent:(UInt32)pos
{
    return events[pos];
}

-(void)addEvent:(MUS147Event*)event
{
    events[numEvents++] = event;
}


@end
