//
//  MUS147Voice.h
//  Music147_2013
//
//  Created by 三浦博行 on 4/26/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUS147Voice : NSObject   
{
    /* the follow member variable will soon be obsolete */
    Float64 normPhase;
    Float64 freq;
    Float64 amp;
    Float64 speed;
    UInt32  midiNum;
}

@property (readwrite) Float64 freq;
@property (readwrite) Float64 amp;
@property (readwrite) Float64 speed;


-(void)fillAudioBuffer:(Float64*)buffer :(UInt32)num_samples;

@end
