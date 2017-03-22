//
//  AppController.h
//  TimeTrackerMenulet
//
//  Created by Maros Kollár on 01.06.11.
//  Copyright 2011 RevDev Ita,Klausner,Kollár OG. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppController : NSObject {
	/* Our outlets which allow us to access the interface */

	IBOutlet NSMenu *statusMenu;
	IBOutlet NSMenuItem *continueMenu;
	IBOutlet NSMenuItem *stopMenu;
	IBOutlet NSMenuItem *workMenu;
	
	/* The other stuff :P */
	NSStatusItem *statusItem;
	NSImage *statusImageWork;
	NSImage *statusImageNoWork;
	NSFileManager* fileManager;
}

-(void) setWork;
/*
-(void) stopWork;
-(void) continueWork;
-(void) runTracker:(NSString*)trackerCommand;
*/
@end