//
//  MUS147ViewController.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/5/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MUS147ViewController.h"

#import "MUS147AQPlayer.h"
#import "MUS147Chord.h"
#import "MUS147Sequence.h"
#import "MUS147Event_Note.h"
extern MUS147Event_Note* note;

extern MUS147AQPlayer* aqp;
extern MUS147Chord* chrd;
extern MUS147Sequence* seq;


MUS147ViewController* viewcon = nil;

@interface MUS147ViewController ()

@end

@implementation MUS147ViewController

@synthesize playing;
@synthesize pitchOn;
@synthesize pos;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)masterVolSlider:(id)sender
{
    if (!playing) {
        for (UInt32 i = 0; i < chrd.numVoices; i++){
            [aqp getVoice:i].amp = masterVolSlider.value/chrd.numVoices;
        }
    }
    else{
        
    }
    

}

- (void)viewDidUnload {
    cMajorButton = nil;
    aMinorButton = nil;
    masterVolSlider = nil;
    fMajorButton = nil;
    dMinorButton = nil;
    gMajoButton = nil;
    eMinorButton = nil;
    eMinorButton = nil;
    bFlatMajorButton = nil;
    bDimButton = nil;
    playing = NO;
    [super viewDidUnload];
}


- (Float64)getMasterVolValue
{
    return masterVolSlider.value;
}

- (void)setAmpMasterVolValue
{
    for (UInt32 i = 0; i < chrd.numVoices; i++)
    {
        [aqp getVoice:i].amp = masterVolSlider.value/chrd.numVoices;
    }
}

-(IBAction)setCMajor:(id)sender
{
    [chrd cMajorPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)cMajorStop:(id)sender
{
    [chrd cMajorStop];
}

- (IBAction)setDMinor:(id)sender
{
    [chrd dMinorPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)stopDMinor:(id)sender
{
    [chrd dMinorStop];
}

- (IBAction)setEMinor:(id)sender
{
    [chrd eMinorPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)stopEMinor:(id)sender
{
    [chrd eMinorStop];
}

- (IBAction)setFMajor:(id)sender
{
    [chrd fMajorPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)stopFMajor:(id)sender
{
    [chrd fMajorStop];
}

- (IBAction)setGMajor:(id)sender
{
    [chrd gMajorPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)stopGMajor:(id)sender
{
    [chrd gMajorStop];
}

- (IBAction)setAMinor:(id)sender
{
    [chrd aMinorPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)stopAMinor:(id)sender
{
    [chrd aMinorStop];
}

- (IBAction)setBFlatMajor:(id)sender
{
    [chrd bFlatMajorPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)stopBFlatMajor:(id)sender
{
    [chrd bFlatMajorStop];
}

- (IBAction)setBDim:(id)sender
{
    [chrd bDimPlay];
    [self setAmpMasterVolValue];
}

- (IBAction)stopBDim:(id)sender
{
    [chrd bDimStop];
}


- (IBAction)seqRec:(id)sender;
{
    
    [aqp.sequencer record];
}

- (IBAction)seqStop:(id)sender
{
    [aqp.sequencer stop];
}



//-(IBAction)zeroAmp:(id)sender
//{
//    if ([aqp getVoice:0 > 0.])
//    {
//        [self resetSound];
//    }
//    else
//    {
//        [self setAmpMasterVolValue];
//    }
//
//
//}

//- (IBAction)seqPlay:(id)sender
//{
//    [aqp.sequencer play];
//}
//
//- (IBAction)seqStop:(id)sender
//{
//    [aqp.sequencer stop];
//}

//- (IBAction)seqRewind:(id)sender
//{
//    [aqp.sequencer rewind];
//}

- (IBAction)loop1Switch:(id)sender
{
    
    if (!playing)
    {
        [aqp.sequencer play];
        playing = YES;
    }
    else
    {
        [aqp.sequencer loopStop];
        playing = NO;
    }
}

- (IBAction)pitchSwitch:(id)sender
{
    if (!pitchOn)
    {
        pitchOn= YES;
    }
    else
    {
        pitchOn= NO;
    }
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)accelleration
{
    MUS147Voice* v;

    if (pitchOn&&playing){
        v = [aqp getVoice:pos*2];
    v.amp = 1./6.;
    v.freq = 300 *  accelleration.x;
    v = [aqp getVoice:pos*2+1];
    v.amp = 1./6.;
    v.freq = 600 * 2 * accelleration.x;
    //        NSLog(@"%f, %f, %f", accelleration.x, accelleration.y, accelleration.z);
    }
}




@end
