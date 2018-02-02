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

// IBAction is the same as void. It also acts as a hint to Interface Builder.
- (IBAction) randomlyGenerateNumber: (id)sender;
- (IBAction) randomlyGenerateNumberBasedOffTime    : (id)sender;


@end

#endif /* RandomController_h */
