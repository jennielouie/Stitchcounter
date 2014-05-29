//
//  ViewController.h
//  Stitchcounter
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CounterBrain.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {

    CounterBrain *brain;
}

@property (nonatomic) CounterBrain *brain;
@end
