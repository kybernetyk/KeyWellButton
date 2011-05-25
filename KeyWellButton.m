//
//  KeyWellButton.m
//  KeyControl
//
//  Created by Jaroslaw Szpilewski on 22.08.08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "KeyWellButton.h"


@implementation KeyWellButton

@synthesize keyCode, modifiers;


- (BOOL)performKeyEquivalent:(NSEvent *)anEvent
{
	if ([self state] == NSOnState)
	{
		//NSLog(@"om: %i, %i",([anEvent keyCode] && [anEvent modifierFlags]),([anEvent modifierFlags] & NSCommandKeyMask));
		//[self setTitle:[NSString stringWithFormat:@"%i,%i",[anEvent keyCode], [anEvent modifierFlags]]];
		
		NSString *modifierString = [NSString string];
/*
		NSAlphaShiftKeyMask = 1 << 16,
		NSShiftKeyMask      = 1 << 17,
		NSControlKeyMask    = 1 << 18,
		NSAlternateKeyMask  = 1 << 19,
		NSCommandKeyMask    = 1 << 20,
		NSNumericPadKeyMask = 1 << 21,
		NSHelpKeyMask       = 1 << 22,
		NSFunctionKeyMask   = 1 << 23,
*/
		
		if ([anEvent modifierFlags] & NSCommandKeyMask)
			modifierString = @"command";

		if ([anEvent modifierFlags] & NSControlKeyMask)
			modifierString = @"control";

		if ([anEvent modifierFlags] & NSShiftKeyMask)
			modifierString = @"shift";

		if ([anEvent modifierFlags] & NSFunctionKeyMask)
			modifierString = @"function";

		if ([anEvent modifierFlags] & NSAlternateKeyMask)
			modifierString = @"alternate";

		
		
		NSString *titleString = [NSString stringWithFormat:@"%@ %@",modifierString,[[anEvent charactersIgnoringModifiers] uppercaseString]];

		
		[self setTitle: titleString];
		
		[self setKeyCode: [anEvent keyCode]];
		[self setModifiers:[anEvent modifierFlags]];
		
		[self setState: NSOffState];
		
		return YES;
	}
	return NO;
}

@end
