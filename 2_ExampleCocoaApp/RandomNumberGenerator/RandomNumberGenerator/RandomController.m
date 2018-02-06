//
//  RandomController.m
//  RandomNumberGenerator
//
//  Created by Nikita Govind on 2/1/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

#include "RandomController.h"

@implementation RandomController

@synthesize resultTextField;

- (IBAction)randomlyGenerateNumber:(id)sender
{
    // Generate a number between 1 and 100 inclusive
    int generated;
    generated = (int)(random() % 100) + 1;
    
    NSLog(@"NIKITA: randomlyGenerateNumber method called = %d", generated);
    
    // Ask the text field to change what it is displaying
    [resultTextField setIntValue:generated];
}

- (IBAction)randomlyGenerateNumberBasedOffTime:(id)sender
{
    NSLog(@"NIKITA: randomlyGenerateNumberBasedOffTime method called ");
    // Seed the random number generator with the time
    srandom((unsigned)time(NULL));
    [resultTextField setStringValue:@"Generator seeded"];
}

// This doesnt have to be invoked from anywhere. It is automatically called when the app launches and the RandomController object is alloc-inited
// When the program is launched, the objects are brought back to life before the application handles any events from the user.
// After being brought to life but before any events are handled, all OBJECTS are automatically sent the message awakeFromNib. Add an awakeFromNib method to RandomGenerator that will initialize the text field’s value.
- (void) awakeFromNib
{
    NSLog(@"NIKITA: awakeFromNib AUTO method called for object RandomController");
    NSDate *now;
    now = [NSDate date];
    [resultTextField setObjectValue:now];
}

@end
