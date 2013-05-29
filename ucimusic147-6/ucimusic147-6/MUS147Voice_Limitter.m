//
//  MUS147Voice_Limitter.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/20/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147Voice_Limitter.h"

@implementation MUS147Voice_Limitter


-(id)init
{
    self = [super init];
    
    maxAmp = 0.99999;
    
    return self;
}

-(void)processAudioBuffer:(Float64*)buffer :(UInt32)num_samples
{
    for (UInt32 i = 0; i < num_samples; i++)
    {
        if (buffer[i] > maxAmp)
            buffer[i] = maxAmp;
        if (buffer[i] < -maxAmp)
            buffer[i] = -maxAmp;
    }
}

@end
