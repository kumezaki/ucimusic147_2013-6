//
//  MUS147Chord.h
//  Music147_2013
//
//  Created by 三浦博行 on 5/20/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUS147Voice.h"

#define kNumMaxVoices 100
@interface MUS147Chord : NSObject
{
    UInt32 numVoices;
}

@property (readwrite, assign) UInt32    numVoices;



- (void)setAmpMax;
-(void)setAmpMasterVolSlider;

- (void)resetSound;

-(void)cMajorPlay;
-(void)cMajorStop;

-(void)dMinorPlay;
-(void)dMinorStop;

-(void)eMinorPlay;
-(void)eMinorStop;

-(void)fMajorPlay;
-(void)fMajorStop;

-(void)gMajorPlay;
-(void)gMajorStop;

-(void)aMinorPlay;
-(void)aMinorStop;

-(void)bFlatMajorPlay;
-(void)bFlatMajorStop;

-(void)bDimPlay;
-(void)bDimStop;

- (UInt32)get1NoteInChord;
- (UInt32)get2NoteInChord;
- (UInt32)get3NoteInChord;


@end
