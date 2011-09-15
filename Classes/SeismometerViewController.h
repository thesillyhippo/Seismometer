//
//  SeismometerViewController.h
//  Seismometer
//
//  Created by Bao-Viet Nguyen on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface SeismometerViewController : UIViewController {
	CMMotionManager *motionManager;
	UILabel *accelerometerLabel;
	UILabel *gyroscopeLabel;
	UILabel *richterLabel;
	UILabel *mercalliLabel;
	double start_g;
	double max_g;
	double current_g;

}

@property (nonatomic, retain) CMMotionManager *motionManager;
@property (nonatomic, retain) IBOutlet UILabel	*accelerometerLabel;
@property (nonatomic, retain) IBOutlet UILabel	*gyroscopeLabel;
@property (nonatomic, retain) IBOutlet UILabel  *richterLabel;
@property (nonatomic, retain) IBOutlet UILabel  *mercalliLabel;

-(IBAction)resetRichter;
-(IBAction)startRichter;


@end

