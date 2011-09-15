//
//  SeismometerAppDelegate.h
//  Seismometer
//
//  Created by Bao-Viet Nguyen on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SeismometerViewController;

@interface SeismometerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SeismometerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SeismometerViewController *viewController;

@end

