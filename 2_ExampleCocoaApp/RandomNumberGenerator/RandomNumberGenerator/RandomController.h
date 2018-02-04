//
//  RandomController.h
//  RandomNumberGenerator
//
//  Created by Nikita Govind on 2/1/18.
//  Copyright © 2018 Nikita Govind. All rights reserved.
//

#ifndef RandomController_h
#define RandomController_h

#import <Foundation/Foundation.h> // contains NSObject
#import <Cocoa/Cocoa.h> // NSTextField

@interface RandomController: NSObject
{
    
}

// IBOutlet is a macro that evaluates to nothing. IBOutlet is a hint to Interface Builder when it reads the declaration of a class from a .h file
@property (weak) IBOutlet NSTextField *resultTextField;

/*
 * IBAction is the same as void. It just acts as a hint to Interface Builder that this is an actiona ssociated with a Cocoa object.
 * They always take the sender as an arg bec this tells the sender which control sent the message
 * Eg. where this info is important? If it is a Checkbox and the box value toggled say from Yes to NO
 * the checkbox button will be pointed to the action mehtod
 - (IBAction)toggleCheckbox:(id)sender
 {
    // Now to read the value of the checkbox, we need the sender object
    BOOL isOn = [sender state];
    ...
 }
 
 */
- (IBAction) randomlyGenerateNumber: (id)sender;
- (IBAction) randomlyGenerateNumberBasedOffTime    : (id)sender;


@end

#endif /* RandomController_h */
