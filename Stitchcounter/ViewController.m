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
@property double stepperValue;
@end

@implementation ViewController

-(CounterBrain *)brain {
    if (!brain) {
        brain = [[CounterBrain alloc] init];
        brain.totalRows = [_totalRows.text doubleValue];
        brain.rowsCompleted =0;
    }
    return brain;
}

/*resetPressed: set totalRows, rowsCompleted, rowsToDo all to zero.  */
- (IBAction)resetPressed:(UIButton *)sender {
    [self brain];
 
    [_rowsCompleted setText:@"0"];
    [_totalRows setText:@"0"];
    [_rowsToDo setText:[_totalRows text]];
    _stepper.value = 0;
}


/*stepperPressed: send totalRow, rowsCompleted, stepper increment to counterbrain*/
/*update counter display, including progress bar*/

- (IBAction)stepperPressed:(UIStepper *)sender {
    _stepperValue = sender.value;
    if(_stepperValue < [self brain].totalRows) {
        [_rowsCompleted setText:[NSString stringWithFormat:@"%g", _stepperValue]];
        [self brain].rowsCompleted = _stepperValue;
        [_rowsToDo setText:[NSString stringWithFormat:@"%g", [[self brain] calculateRowsToDo]]];
    } else {
        [_rowsToDo setText:@"All Done!"];
        [_rowsCompleted setText:[NSString stringWithFormat:@"%g", [self brain].totalRows]];
        _stepper.value = [self brain].totalRows;
    }
}


/*totalRowInput: update total Rows, recalculate rowsToDo, keep rowsCompleted/stepper unchanged UNLESS new total Rows is less than rowsCompleted, in which case latter/stepper will be reset to zero*/

- (IBAction)totalRowInput:(UITextField *)sender {
    NSString *totalText = [sender text];
    
    [_totalRows setText:totalText];
    if ([self brain].totalRows > [totalText doubleValue]){
        
    }
    [self brain].totalRows = [totalText doubleValue];
    [self brain].rowsCompleted = _stepperValue;
    [_rowsToDo setText:[NSString stringWithFormat:@"%g", [[self brain] calculateRowsToDo]]];
    

}


- (void)viewDidLoad
{
   
    _totalRows.returnKeyType = UIReturnKeyDone;
    _totalRows.delegate = self;


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
