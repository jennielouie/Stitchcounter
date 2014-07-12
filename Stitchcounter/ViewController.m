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
@property  IBOutlet UITextField *totalRows;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UITextField *editableRowsCompletedDisplay;
@property (weak, nonatomic) IBOutlet UIButton *alert;
@end

@implementation ViewController

-(CounterBrain *)brain {
    if (!brain) {
        brain = [[CounterBrain alloc] initWithTotalRows:_totalRows.text];
    }
    return brain;
}



- (IBAction)stepperPressed:(UIStepper *)sender {
    double steppervalue = sender.value;
    [[self brain] updateWithNewRowsCompleted:steppervalue];
    [self updateUI];
}



- (IBAction)totalRowInput:(UITextField *)sender {
    double totalText = [[sender text] doubleValue];
    [[self brain] updateWithNewTotal:totalText];
    [self updateUI];
}

- (IBAction)editRowsCompletedPressed:(UITextField *)sender {
    double editedRowsCompleted = [[sender text] doubleValue];
    [[self brain] updateWithEditedRowsCompleted:editedRowsCompleted];
    [self updateUI];
}



-(void)updateUI {
    [_rowsToDo setText:[NSString stringWithFormat:@"%g", [self brain].rowsToDo]];
    [_totalRows setText:[NSString stringWithFormat:@"%g", [self brain].totalRows]];
    [_editableRowsCompletedDisplay setText:[NSString stringWithFormat:@"%g", [self brain].rowsCompleted]];
    _stepper.value = [_editableRowsCompletedDisplay.text doubleValue];
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
        [[self brain] resetCounter];
        [self updateUI];
    }
}


- (void)viewDidLoad
{
    _totalRows.clearsOnBeginEditing = YES;
    _totalRows.returnKeyType = UIReturnKeyDone;
    _totalRows.delegate = self;
    _editableRowsCompletedDisplay.clearsOnBeginEditing = YES;
    _editableRowsCompletedDisplay.returnKeyType = UIReturnKeyDone;
    _editableRowsCompletedDisplay.delegate = self;
    NSLog(@"loaded view");
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
