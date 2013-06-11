//
//  MUS147ViewController.h
//  Music147_2013
//
//  Created by Kojiro Umezaki on 4/5/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MUS147Sequencer.h"
@interface MUS147ViewController : UIViewController <UIAccelerometerDelegate>
{
//    IBOutlet UISlider* freq0Slider;
//    IBOutlet UISlider* amp0Slider;
//    //IBOutlet UIButton* play0MiddleC;
//    IBOutlet UISlider* freq1Slider;
//    IBOutlet UISlider* amp1Slider;
//    __unsafe_unretained IBOutlet UISlider *freq2Slider;
//    __unsafe_unretained IBOutlet UISlider *amp2Slider;

    IBOutlet UIButton *cMajorButton;
    IBOutlet UIButton *dMinorButton;
    IBOutlet UIButton *eMinorButton;
    IBOutlet UIButton *fMajorButton;
    IBOutlet UIButton *gMajoButton;
    IBOutlet UIButton *aMinorButton;
    IBOutlet UIButton *bFlatMajorButton;
    IBOutlet UIButton *bDimButton;
        
    IBOutlet UISlider *masterVolSlider;
    
    MUS147Sequencer* seqer;
    BOOL    playing;
    BOOL    pitchOn;
//    IBOutlet UIButton *stopButton;
    
}

@property (readwrite) UInt32 midiNum;
@property (readwrite) BOOL    playing;
@property (readwrite) BOOL    pitchOn;




    //UI items for the first note
//    -(IBAction)setFreq0:(id)sender;
//    -(IBAction)setAmp0:(id)sender;
    //-(IBAction)setFreqC0:(id)sender;

    //UI items for the second note
//    -(IBAction)setFreq1:(id)sender;
//    -(IBAction)setAmp1:(id)sender;

    //UI items for the third note
//    -(IBAction)setFreq2:(id)sender;
//    -(IBAction)setAmp2:(id)sender;

//UI buttons for making chord sounds


- (void)setAmpZero;
- (void)resetFreq;
- (void)setAmpMasterVolValue;

- (void)accelerometer: (UIAccelerometer *)accelerometerdidAccelerate :(UIAcceleration *)accelleration;


- (IBAction)setCMajor:(id)sender;
- (IBAction)cMajorStop:(id)sender;

- (IBAction)setDMinor:(id)sender;
- (IBAction)stopDMinor:(id)sender;

- (IBAction)setEMinor:(id)sender;
- (IBAction)stopEMinor:(id)sender;

- (IBAction)setFMajor:(id)sender;
- (IBAction)stopFMajor:(id)sender;

- (IBAction)setGMajor:(id)sender;
- (IBAction)stopGMajor:(id)sender;

- (IBAction)setAMinor:(id)sender;
- (IBAction)stopAMinor:(id)sender;

- (IBAction)setBFlatMajor:(id)sender;
- (IBAction)stopBFlatMajor:(id)sender;

- (IBAction)setBDim:(id)sender;
- (IBAction)stopBDim:(id)sender;

- (IBAction)seqRec:(id)sender;
- (IBAction)seqStop:(id)sender;

-(IBAction)masterVolSlider:(id)sender;
//-(IBAction)zeroAmp:(id)sender;

//- (IBAction)seqPlay:(id)sender;
//- (IBAction)seqStop:(id)sender;
- (IBAction)seqRewind:(id)sender;

- (IBAction)loop1Switch:(id)sender;
- (IBAction)pitchSwitch:(id)sender;

@end