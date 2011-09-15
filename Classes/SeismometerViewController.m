//
//  SeismometerViewController.m
//  Seismometer
//
//  Created by Bao-Viet Nguyen on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SeismometerViewController.h"

@implementation SeismometerViewController
@synthesize motionManager;
@synthesize accelerometerLabel;
@synthesize gyroscopeLabel;
@synthesize richterLabel;
@synthesize mercalliLabel;

-(IBAction)startRichter{
	current_g = start_g;
}

-(IBAction)resetRichter{
	max_g = 0;
}


/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	if (max_g == NO) max_g = 0;
	self.motionManager = [[[CMMotionManager alloc] init] autorelease];
	NSOperationQueue *queue = [[[NSOperationQueue alloc] init] autorelease];
	if (motionManager.accelerometerAvailable) {
		motionManager.accelerometerUpdateInterval = 1.0/10.0;
		[motionManager startAccelerometerUpdatesToQueue:queue withHandler:
		 ^(CMAccelerometerData *accelerometerData, NSError *error){
			 NSString *labelText;
			 
			 NSString *richterText;
			 NSString *mercalliText;
			 
			 if (error) {
				 [motionManager stopAccelerometerUpdates];
				 labelText = [NSString stringWithFormat:@"Accelerometer encountered error:%@", error];
			 }
			 else{
				 
				 labelText = [NSString stringWithFormat:@"Accelerometer\n------------\nx: %+.2f\ny: %+.2f\nz: %+.3f",
							  accelerometerData.acceleration.x,
							  accelerometerData.acceleration.y,
							  accelerometerData.acceleration.z];
				 start_g = accelerometerData.acceleration.z;
				 double test_max = fabs(accelerometerData.acceleration.z - current_g);
				 if (test_max > max_g) max_g = test_max;
				 
				 
				 //richter scale
				 if (max_g > 0.005 && max_g < 0.01)
				 {
					 richterText = @"Richter Scale:\n3";
				 }
				 
				 else if (max_g > 0.01 && max_g < 0.05)
				 {
					 richterText = @"Richter Scale:\n4";
				 }
				 else if (max_g > 0.05 && max_g < 0.1)
				 {
					 richterText = @"Richter Scale:\n5";
				 }
				 else if (max_g > 0.1 && max_g < 0.5)
				 {
					 richterText = @"Richter Scale:\n6";
				 }
				 else if (max_g > 0.5 && max_g < 1.09)
				 {
					 richterText = @"Richter Scale:\n7";
				 }
				 else if (max_g > 1.09 && max_g < 3)
				 {
					 richterText = @"Richter Scale:\n8";
				 }
				 
				 else {
					 richterText = @"Shake Level";
				 }
				 
				 
				 //mercalli scale
				 if (max_g < 0.0017)
				 {
					 mercalliText = @"Mercalli Scale: I\nPerceived Shaking: Not Felt";
				 }
				 else if (max_g > 0.0017 && max_g < 0.014)
				 {
					 mercalliText = @"Mercalli Scale: II-III\nPerceived Shaking: Weak";
				 }
				 else if (max_g > 0.014 && max_g <0.039)
				 {
					 mercalliText = @"Mercalli Scale: IV\nPerceived Shaking: Light";
				 }
				 else if (max_g >0.039 && max_g < 0.092)
				 {
					 mercalliText = @"Mercalli Scale: V\nPerceived Shaking: Moderate";
				 }
				 else if (max_g > 0.092 && max_g <0.18)
				 {
					 mercalliText = @"Mercalli Scale: VI\nPerceived Shaking: Strong";
				 }
				 else if (max_g > 0.18 && max_g < 0.34)
				 {
					 mercalliText = @"Mercalli Scale: VII\nPerceived Shaking: Very Strong";
				 }
				 else if (max_g > 0.34 && max_g < 0.65)
				 {
					 mercalliText = @"Mercalli Scale: VIII\nPerceived Shaking: Severe";
				 }
				 else if (max_g > 0.65 && max_g < 1.24)
				 {
					 mercalliText = @"Mercalli Scale: IX\nPerceived Shaking: Violent";
				 }
				 else {
					 mercalliText = @"Mercalli Scale: X+\nPerceived Shaking: Extreme";
				 }
				 
				 
				 
			 }
			 [mercalliLabel performSelectorOnMainThread:@selector(setText:) withObject:mercalliText waitUntilDone:YES];
			 [richterLabel performSelectorOnMainThread:@selector(setText:) withObject:richterText waitUntilDone:YES];
			 [accelerometerLabel performSelectorOnMainThread:@selector(setText:)
												  withObject:labelText
											   waitUntilDone:YES];
		 }];
	}
	else {
		accelerometerLabel.text = @"This device has no accelerometer";
	}
}




/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.motionManager = nil;
	self.accelerometerLabel = nil;
	self.gyroscopeLabel = nil;
	self.richterLabel = nil;
	self.mercalliLabel = nil;
	[super viewDidUnload];
}



- (void)dealloc {
	[motionManager release];
	[accelerometerLabel release];
	[gyroscopeLabel release];
	[richterLabel release];
	[mercalliLabel release];
    [super dealloc];
}

@end
