//
//  DetailView.m
//  testingAutoLayout
//
//  Created by Jennifer Louie on 7/10/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "DetailView.h"

@interface DetailView ()
@property (strong, nonatomic) UITextField *total;
@property (strong, nonatomic) UITextField *completed;

@end




@implementation DetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)addDetailSubviews
{
    self.total = [[UITextField alloc] init];
    self.total.translatesAutoresizingMaskIntoConstraints = NO;
    self.total.text = @"Total: 0";
    self.total.keyboardType = UIKeyboardTypeNumberPad;
    self.total.textColor = [UIColor purpleColor];
    //self.total.backgroundColor = [UIColor clearColor];
    self.total.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:self.total];
    
    [self.total addTarget:self action:@selector(totalWasEdited) forControlEvents:UIControlEventEditingDidEnd];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.total
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:0.2
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.total
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.total
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.5
                                                      constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.total
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeWidth
                                                     multiplier:0.4
                                                       constant:0]];
    
    UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(doneClicked:)];
    UIBarButtonItem *flex1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil] ;
    
    UIBarButtonItem *flex2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil] ;
    
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:flex1, flex2, doneButton, nil]];
    self.total.inputAccessoryView = keyboardDoneButtonView;
    
    
    
    self.completed = [[UITextField alloc] init];
    self.completed.translatesAutoresizingMaskIntoConstraints = NO;
    self.completed.text = @"Done: 0";
    self.completed.textColor = [UIColor purpleColor];
    self.completed.keyboardType = UIKeyboardTypeNumberPad;
    //self.completed.backgroundColor = [UIColor clearColor];
    self.completed.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:self.completed];
     [self.completed addTarget:self action:@selector(completedWasEdited) forControlEvents:UIControlEventEditingDidEnd];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.completed
                                                     attribute:NSLayoutAttributeLeading
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.2
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.completed
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.completed
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.5
                                                      constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.completed
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeWidth
                                                     multiplier:0.4
                                                       constant:0]];
    
    UIToolbar* keyboardDoneButtonView2 = [[UIToolbar alloc] init];
    [keyboardDoneButtonView2 sizeToFit];
    UIBarButtonItem* doneButton2 = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(doneClicked2:)];
    
    [keyboardDoneButtonView2 setItems:[NSArray arrayWithObjects:flex1, flex2, doneButton2, nil]];
    self.completed.inputAccessoryView = keyboardDoneButtonView2;
    
}


- (void)doneClicked:(id)sender
{
    NSLog(@"Done Clicked.");
    [self.total endEditing:YES];
}

- (void)doneClicked2:(id)sender
{
    NSLog(@"Done Clicked.");
    [self.completed endEditing:YES];
}

-(void)totalWasEdited
{
    [self.delegate  detailView:self
  totalTextFieldEditedWithText:self.total.text];
}

-(void)completedWasEdited
{
    [self.delegate      detailView:self
  completedTextFieldEditedWithText:self.completed.text];
}

- (void)addDetailRules
{
    _total.clearsOnBeginEditing = YES;
    _total.returnKeyType = UIReturnKeyDone;
    _completed.clearsOnBeginEditing = YES;
    _completed.returnKeyType = UIReturnKeyDone;
    NSLog(@"loaded view");
}

-(void)updateDetailViewTotal:(double)total AndCompleted:(double)completed
{
    [_total setText:[NSString stringWithFormat:@"Total: %g", total]];
    [_completed setText:[NSString stringWithFormat:@"Done: %g", completed]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
