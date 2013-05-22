//
//  MUS147Sequence.h
//  Music147_2013
//
//  Created by 三浦博行 on 5/19/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUS147Event.h"
#define kMaxNumEvents 100

@interface MUS147Sequence : NSObject
{
    MUS147Event* events[kMaxNumEvents];
    UInt32 numEvents;
}

@property (readwrite) UInt32 numEvents;

-(id)init;
-(MUS147Event*)getEvent:(UInt32)pos;

@end
