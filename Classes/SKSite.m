//
//  SKSite.m
//  StackKit
//
//  Created by Dave DeLong on 1/25/10.
//  Copyright 2010 Home. All rights reserved.
//

#import "StackKit_Internal.h"

@implementation SKSite

@synthesize siteURL;
@synthesize cachedPosts, cachedUsers, cachedTags;
@synthesize timeoutInterval;

- (id) initWithURL:(NSURL *)aURL {
	if (self = [super initWithSite:nil]) {
		siteURL = [aURL retain];
		
		cachedPosts = [[NSMutableDictionary alloc] init];
		cachedUsers = [[NSMutableDictionary alloc] init];
		cachedTags = [[NSMutableDictionary alloc] init];
		
		timeoutInterval = 60.0;
	}
	return self;
}

- (void) dealloc {
	[siteURL release];
	
	[cachedPosts release];
	[cachedUsers release];
	[cachedTags release];
	
	[super dealloc];
}

- (SKSite *) site {
	return [[self retain] autorelease];
}

- (void) cacheUser:(SKUser *)newUser {
	[cachedUsers setObject:newUser forKey:[newUser userID]];
}

- (void) cacheTag:(SKTag *)newTag {
	
}

- (void) cachePost:(SKPost *)newPost {
	[cachedPosts setObject:newPost forKey:[newPost postID]];
}

- (SKUser *) userWithID:(NSString *)aUserID {
	return [[[SKUser alloc] initWithSite:self userID:aUserID] autorelease];
}

@end
