//
//  AppController.m
//  TimeTrackerMenulet
//
//  Created by Maros Kollár on 01.06.11.
//  Copyright 2011 RevDev Ita,Klausner,Kollár OG. All rights reserved.
//

#import "AppController.h"

@implementation AppController

-(void) setWork {
	
	NSString* fileCurrent = [NSHomeDirectory() stringByAppendingPathComponent:@".TimeTracker/current.txt"];
	
	if ([fileManager fileExistsAtPath: fileCurrent ] == YES) {
		NSString *textCurrent = [[NSString alloc] initWithContentsOfFile:fileCurrent];
		
		[workMenu setTitle:textCurrent];
		
		//Sets the images in our NSStatusItem
		[statusItem setImage:statusImageWork];
		
		/*[continueMenu setEnabled:FALSE];
		[stopMenu setEnabled:TRUE];	
		[continueMenu setAction:nil];
		[stopMenu setAction:@selector(stopWork)];*/
	} else {
		//Sets the images in our NSStatusItem
		[statusItem setImage:statusImageNoWork];
		
		[workMenu setTitle:@"Currently not working"];
		
		/*[continueMenu setEnabled:TRUE];
		[stopMenu setEnabled:FALSE];	
		[continueMenu setAction:@selector(continueWork)];
		[stopMenu setAction:nil];*/
	}
}

- (void) awakeFromNib {
	//Create the NSStatusBar and set its length
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:27] retain];
	
	//Create NSFileManager
	fileManager = [NSFileManager defaultManager];
	
	//Used to detect where our files are
	NSBundle *bundle = [NSBundle mainBundle];
	//Allocates and loads the images into the application which will be used for our NSStatusItem
	statusImageWork = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"Work" ofType:@"pdf"]];
	statusImageNoWork = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"NoWork" ofType:@"pdf"]];
	
	[statusItem setMenu:statusMenu];
	/*[continueMenu setTarget:self];
	[stopMenu setTarget:self];*/
	
	//Enables highlighting
	[statusItem setHighlightMode:YES];
	
	// Initialize widget
	[self setWork];
	
	// Initialize timer
	NSTimer *myTimer;
	myTimer = [NSTimer 
			   scheduledTimerWithTimeInterval:1			   
			   target:self
			   selector:@selector(setWork)
			   userInfo:nil 
			   repeats:YES];
}

- (void) dealloc {
	//Releases the 2 images we loaded into memory
	[statusImageWork release];
	[statusImageNoWork release];
	[fileManager release];
	[super dealloc];
}

/*
- (void) stopWork {
    [self runTracker:@"stop"];
}
		 
- (void) continueWork {
	[self runTracker:@"continue"];
}

-(void) runTracker:(NSString*)trackerCommand
{
	//NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:@"Info.plist"];
	//NSString *trackerPath = [plistDict objectForKey:@"TrackerPath"];
	NSString *trackerPath = @"/opt/perl5.14/bin/tracker";
	NSTask *task = [[NSTask alloc] init];
	NSPipe *pipe = [NSPipe pipe];
	NSFileHandle *file = [pipe fileHandleForReading];
    
	NSLog (@"script runnint:\n%@", trackerPath);    

	
	[task setLaunchPath: trackerPath];
	[task setArguments: [NSArray arrayWithObjects:trackerCommand, nil]];
    [task setStandardOutput: pipe];
	[task launch];
	
    NSData *data = [file readDataToEndOfFile];
    NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"script returned:\n%@", string);    
}
*/

@end
