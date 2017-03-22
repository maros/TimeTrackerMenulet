//
//  CurrentWork.h
//  TimeTrackerMenulet
//
//  Created by Maros Kollár on 01.06.11.
//  Copyright 2011 RevDev Ita,Klausner,Kollár OG. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CurrentWork : NSObject {
	NSString *project;
	NSString *start;
	NSString *user;
	NSArray *tags;
}

@end
