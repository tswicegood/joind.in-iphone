//
//  TalkListModel.m
//  joindinapp
//
//  Created by Kevin on 01/01/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TalkListModel.h"
#import "TalkDetailModel.h"


@implementation TalkListModel

@synthesize talks;

- (TalkListModel *)init {
	self.talks = [NSMutableArray array];
	return self;
}

- (void)addTalk:(TalkDetailModel *)tdm {
	[tdm retain];
	[self.talks addObject:tdm];
}

- (TalkDetailModel *)getTalkDetailModelAtIndex:(NSUInteger)idx {
	return [self.talks objectAtIndex:idx];
}

- (void)sort {
	[self sort:true];
}

- (void)sort:(BOOL)forwards {
	[self.talks sortUsingSelector:@selector(comparator:)];
	if (!forwards) {
		// Reverse the array
		int n = [self.talks count];
		for (int i=0; i<n/2; ++i) {
			id c  = [[self.talks objectAtIndex:i] retain];
			[self.talks replaceObjectAtIndex:i withObject:[self.talks objectAtIndex:n-i-1]];
			[self.talks replaceObjectAtIndex:n-i-1 withObject:c];
		}
	}
}

- (NSUInteger)getNumTalks {
	return [self.talks count];
}

@end
