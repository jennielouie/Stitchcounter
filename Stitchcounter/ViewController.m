//
//  ViewController.m
//  Stitchcounter
//
//  Created by Jennifer Louie on 3/19/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *rowsToDo;
@property (weak, nonatomic) IBOutlet UILabel *rowsCompleted;
@property  IBOutlet UITextField *totalRows;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UITextField *editableRowsCompletedDisplay;
@property (weak, nonatomic) IBOutlet UIButton *alert;
@property double stepperValue;
@end

@implementation ViewController

-(CounterBrain *)brain {
    if (!brain) {
        brain = [[CounterBrain alloc] initWithTotalRows:_totalRows.text];
    }
    return brain;
}


-(void)setRowsCompletedToZero {
    _stepper.value = 0;
    [_rowsCompleted setText:@"0"];
    [self brain].rowsCompleted = 0;
}

- (IBAction)alertButtonPressed:(UIButton *)sender {
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Reset all counts to zero?"
                                                    message:@"This cannot be undone"
                                                   delegate:self
                                            cancelButtonTitle:@"No, keep values"
                                            otherButtonTitles: @"Yes, reset",nil];
    [self.alert setTitle:@"Reset" forState:UIControlStateNormal];
    [alert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Yes, reset"])
    {
        [_totalRows setText:@"0"];
        [_rowsToDo setText:@"0"];
        [self brain].totalRows = 0;
        [self setRowsCompletedToZero];
        [self brain];
    }

}


- (IBAction)stepperPressed:(UIStepper *)sender {
    _stepperValue = sender.value;
    [_rowsCompleted setText:[NSString stringWithFormat:@"%g", _stepperValue]];
    if(_stepperValue < [self brain].totalRows) {
        [self brain].rowsCompleted = _stepperValue;
        
        [_rowsToDo setText:[NSString stringWithFormat:@"%g", [[self brain] calculateRowsToDo]]];
    } else {
        [_rowsToDo setText:@"All Done!"];
        [_rowsCompleted setText:[NSString stringWithFormat:@"%g", [self brain].totalRows]];
        sender.value = [self brain].totalRows;
    }
}
- (IBAction)editRowsCompletedPressed:(UITextField *)sender {
   double newRowsCompleted = [[sender text] doubleValue];
    if (newRowsCompleted < [self brain].totalRows){
        [self brain].rowsCompleted = newRowsCompleted;
        [_editableRowsCompletedDisplay setText: [NSString stringWithFormat:@"%g", newRowsCompleted]];
    }
}



- (IBAction)totalRowInput:(UITextField *)sender {
    NSString *totalText = [sender text];
    
    if ([self brain].rowsCompleted > [totalText doubleValue]){
        [self setRowsCompletedToZero];
    }
    [self brain].totalRows = [totalText doubleValue];
    [_rowsToDo setText:[NSString stringWithFormat:@"%g", [[self brain] calculateRowsToDo]]];
    
}


- (void)viewDidLoad
{
    _totalRows.clearsOnBeginEditing = YES;
    _totalRows.returnKeyType = UIReturnKeyDone;
    _totalRows.delegate = self;
    _editableRowsCompletedDisplay.clearsOnBeginEditing = YES;
    _editableRowsCompletedDisplay.returnKeyType = UIReturnKeyDone;
    _editableRowsCompletedDisplay.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
