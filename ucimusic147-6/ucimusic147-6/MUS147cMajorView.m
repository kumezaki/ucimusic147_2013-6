//
//  MUS147cMajorView.m
//  Music147_2013
//
//  Created by 三浦博行 on 5/1/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147cMajorView.h"
#import "MUS147AQPlayer.h"

extern MUS147AQPlayer* aqp;

#define A57     220.000
#define middleC 262.626
#define D62     293.665
#define Ds63    311.127
#define E64     329.628
#define F65     349.228
#define Fs66    369.994
#define G67     391.995
#define A69     440.000
#define Bf70    466.164
#define B71     493.883
#define C72     523.251
#define D74     587.330
#define E76     659.255
#define F77     698.457

@implementation MUS147cMajorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)doTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * t in touches)
    {
        [aqp getVoice:0].freq = middleC;
        [aqp getVoice:1].freq = E64;
        [aqp getVoice:2].freq = G67;
        [aqp getVoice:0].amp = 1./kNumVoices;
        [aqp getVoice:1].amp = 1./kNumVoices;
        [aqp getVoice:2].amp = 1./kNumVoices;
        
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
    [aqp getVoice:0].amp = 0;
    [aqp getVoice:1].amp = 0;
    [aqp getVoice:2].amp = 0;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouches:touches withEvent:event];
}
@end
