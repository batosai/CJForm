//
//  AccelerometreViewController.m
//  CJForm
//
//  Created by Jeremy on 08/04/13.
//  Copyright (c) 2013 chaufourier. All rights reserved.
//

#define kAccelerometerFrequency            40 // nombre de fois par seconde (hertz) qu'on "sample" l'accelerometre
#define kFilteringFactor                0.1 // constante utilisee pour un filtre passe haut
#define kMinEraseInterval                0.5 // intervalle minimal entre deux "samples" pour declencher la fonction "secouer"
#define kEraseAccelerationThreshold        2.0 // seuil d'acceleration

#import "AccelerometreViewController.h"

@implementation AccelerometreViewController
BOOL secouer=NO;




// cette methode est deja definie dans le SDK
- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	UIAccelerationValue    length,x,y,z; // ce sont les paramètres de notre accelerometre

	//on utilise un filtre passe-haut pour compenser l'influence de la gravite : on retrouve nos constantes declarees plus haut dans les #define
	myAccelerometer[0] = acceleration.x * kFilteringFactor + myAccelerometer[0] * (1.0 - kFilteringFactor);
	myAccelerometer[1] = acceleration.y * kFilteringFactor + myAccelerometer[1] * (1.0 - kFilteringFactor);
	myAccelerometer[2] = acceleration.z * kFilteringFactor + myAccelerometer[2] * (1.0 - kFilteringFactor);

	// on calcule les valeurs pour nos 3 axes de l'accelerometre
	x = acceleration.x - myAccelerometer[0];
	y = acceleration.y - myAccelerometer[0];
	z = acceleration.z - myAccelerometer[0];

	// on calcule l'intensite de l'acceleration courante
	length = sqrt(x * x + y * y + z * z);

	// si l'iphone est secoue, on fait quelque chose (ici play ou stop)
	// on peut jouer sur les paramètres pour accommoder la sensibilité du detecteur de "secousse", c'est a l'appreciation de chacun
	// pour utiliser l'accelerometre, on scrute la difference de deplacement ou/et d'acceleration entre deux instants donnes : la methode CFAbsoluteTimeGetCurrent() permet d'obtenir la date de l'instant t2, qu'on compare a l'instant t1 donne par lastTime
	if((length >= kEraseAccelerationThreshold) && (CFAbsoluteTimeGetCurrent() > lastTime + kMinEraseInterval))

	{
		secouer=YES;
        NSLog(@"secouer");
        [audioPlayer play];
	}
	else
	{
		secouer=NO;
	}


}
-(BOOL) secouer
{
	return secouer;

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];


	// Configure l'accelerometre et démarre la scrutation d'intervalle
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / kAccelerometerFrequency)];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];




    NSError *error = nil;
    audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"son.mp3" ofType:nil]]
                   error:&error];
    if(error) NSLog(@"Error AV : %@",error);
    audioPlayer.numberOfLoops = 0;
    audioPlayer.volume = 1;
    [audioPlayer prepareToPlay]; //pour éviter un temps d'attente lors du lancement du son


}

@end
