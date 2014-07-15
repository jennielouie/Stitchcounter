//
//  Prog2ViewController.h
//  testingAutoLayout
//
//  Created by Jennifer Louie on 7/9/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StitchCountView.h"
#import "DetailView.h"
#import "CounterBrain.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface Prog2ViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate, DetailViewDelegate, StitchCountViewDelegate>
{
    CounterBrain *brain;
}

@end
