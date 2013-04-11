//
//  AccelerometreViewController.h
//  CJForm
//
//  Created by Jeremy on 08/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
//#import <AudioToolbox/AudioToolbox.h>


// attention, ici on "delegue" la fonction accelerometre a notre viewController
@interface AccelerometreViewController : UIViewController<UIAccelerometerDelegate> {
	//parametres de l'accelerometre
	UIAccelerationValue    myAccelerometer[3];
	CFTimeInterval        lastTime;

    AVAudioPlayer          *audioPlayer;
}
@property (nonatomic, retain) IBOutlet UILabel *labelPlay;



- (void) accelerometer:(UIAccelerometer *)accelerometre didAccelerate:(UIAcceleration *)acceleration; //méthode contenue dans le SDK d'Apple
- (BOOL) secouer;




@end