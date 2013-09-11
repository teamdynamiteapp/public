/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiAddsafarireadinglistModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <SafariServices/SafariServices.h>

@implementation TiAddsafarireadinglistModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"c4522d3b-8c0f-4778-a9a3-e84a4c515c88";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.addsafarireadinglist";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)add:(id)args
{
    ENSURE_UI_THREAD(add, args);
    
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    NSString *title = [args objectForKey:@"title"];
    NSString *url = [args objectForKey:@"url"];
    NSString *previewText = [args objectForKey:@"previewText"];
    BOOL *status = NO;
    NSString *message = @"success";
    
    SSReadingList * readList = [SSReadingList defaultReadingList];
    NSError * error = nil;
    
    if ( [SSReadingList supportsURL:[NSURL URLWithString:url]] ) {
        status = [readList addReadingListItemWithURL:[NSURL URLWithString:url] title:title previewText:previewText error:&error];
        if ( error ) {
            message = [error localizedDescription];
        }
    } else {
        message = @"not support url";
    }
    NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys:NUMBOOL(status),@"status",message, @"message",nil];
    [self fireEvent:@"done" withObject:event];
}

@end
