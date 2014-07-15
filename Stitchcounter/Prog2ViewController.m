//
//  Prog2ViewController.m
//  testingAutoLayout
//
//  Created by Jennifer Louie on 7/9/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "Prog2ViewController.h"

@interface Prog2ViewController ()
@property (strong, nonatomic) StitchCountView *stitchCountWindow3;
@property (strong, nonatomic) DetailView *detailsWindow3;
@property (strong, nonatomic) UIButton *resetButton3;
@property (strong, nonatomic) TPKeyboardAvoidingScrollView *mainScrollView;
@property BOOL frogged;



@end

@implementation Prog2ViewController

-(CounterBrain *)brain
{
    if (!brain) {
        brain = [[CounterBrain alloc] initWithTotalRows:0];
    }
    return brain;
}

-(void)detailView:(DetailView *)detailView totalTextFieldEditedWithText:(NSString *)total
{
    double totalNumber = [total doubleValue];
    if (totalNumber > 0)
    {
        [[self brain] updateWithNewTotal:totalNumber];
    }
    [self updateUI];

}

-(void)detailView:(DetailView *)detailView completedTextFieldEditedWithText:(NSString *)completed
{
    double completedNumber = [completed doubleValue];
    
    if ([self brain].rowsCompleted > completedNumber)
    {
        self.frogged = YES;
    } else
    {
        self.frogged = NO;
    }
    
    [[self brain] updateWithNewRowsCompleted:completedNumber];
    [self updateUI];
}

- (void)stitchCountViewIncrementCount:(StitchCountView *)stitchCountView
{
    if ([self brain].totalRows !=0)
    {
        [[self brain] changeRowsCompletedWithDelta:1];
        self.frogged = NO;
        [self updateUI];
    }
}
- (void)stitchCountViewDecrementCount:(StitchCountView *)stitchCountView
{
    if ([self brain].totalRows !=0)
    {
        [[self brain] changeRowsCompletedWithDelta:-1];
        self.frogged = YES;
        [self updateUI];
    }
}

-(void)updateUI {
    double JStotal =[self brain].totalRows;
    double JScompleted = [self brain].rowsCompleted;
    double JSstitchesToDo = [self brain].rowsToDo;
    [self.detailsWindow3 updateDetailViewTotal: JStotal AndCompleted:JScompleted];
    [self.stitchCountWindow3 updateStitchCount: JSstitchesToDo];
    [self.stitchCountWindow3 updateBannerInfo: JSstitchesToDo comparedToTotal:JStotal withDecrement:self.frogged];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self addRules];
    [self.detailsWindow3 addDetailRules];
    self.frogged = NO;
    
    // Do any additional setup after loading the view.
}


- (void)setupViews
{
    self.mainScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:self.mainScrollView];
    
    self.stitchCountWindow3 = [StitchCountView new];
    self.stitchCountWindow3.translatesAutoresizingMaskIntoConstraints = NO;
    self.stitchCountWindow3.backgroundColor = [UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0];
    self.stitchCountWindow3.delegate = self;
    [self.mainScrollView addSubview:self.stitchCountWindow3];
    [self.stitchCountWindow3 addStitchCountSubviews];
    
    self.detailsWindow3 = [DetailView new];
    self.detailsWindow3.translatesAutoresizingMaskIntoConstraints = NO;
    self.detailsWindow3.backgroundColor = [UIColor colorWithRed:1.00 green:0.83 blue:0.58 alpha:1.0];
    self.detailsWindow3.delegate = self;
    [self.mainScrollView addSubview:self.detailsWindow3];
    [self.detailsWindow3 addDetailSubviews];
    
    self.resetButton3 = [UIButton new];
    self.resetButton3.translatesAutoresizingMaskIntoConstraints = NO;
    self.resetButton3.backgroundColor = [UIColor clearColor];
    [self.resetButton3 setTitle:@"Reset Counters" forState:UIControlStateNormal];
    [self.resetButton3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.resetButton3 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.mainScrollView addSubview:self.resetButton3];
    
    
    [self.resetButton3 addTarget:self action:@selector(resetButtonTapped) forControlEvents:UIControlEventTouchUpInside];

}

-(void)resetButtonTapped
{

UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Reset all counts to zero?"
                                                message:@"This cannot be undone"
                                               delegate:self
                                      cancelButtonTitle:@"No, keep values"
                                      otherButtonTitles: @"Yes, reset",nil];
[self.resetButton3 setTitle:@"Reset All" forState:UIControlStateNormal];
[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Yes, reset"])
    {
        [[self brain] resetCounter];
        [self updateUI];
        [self.stitchCountWindow3 resetBannerInfo];
    }
}

-(void)addRules
{
    NSDictionary *viewsDict = @{@"stitchCount":self.stitchCountWindow3, @"details":self.detailsWindow3, @"reset":self.resetButton3};
    NSDictionary *metricsDict = @{@"vSpacing":@20,@"hSpacing":@10};
    
    NSArray *constraint_POS_V =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[stitchCount]"
                                                                       options:0
                                                                       metrics:metricsDict
                                                                         views:viewsDict];
    [self.mainScrollView  addConstraints:constraint_POS_V];
    
    [self.mainScrollView  addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.stitchCountWindow3
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.mainScrollView
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.8
                              constant:0]];
    
    [self.mainScrollView  addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.stitchCountWindow3
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.mainScrollView
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.6
                              constant:0]];
    
    [self.mainScrollView  addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.stitchCountWindow3
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.mainScrollView
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    NSLayoutConstraint *detailsH = [NSLayoutConstraint
                                    constraintWithItem:self.detailsWindow3
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.mainScrollView                                     attribute:NSLayoutAttributeHeight
                                    multiplier:0.1
                                    constant:0];
    NSLayoutConstraint *detailsW = [NSLayoutConstraint
                                    constraintWithItem:self.detailsWindow3
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.stitchCountWindow3
                                    attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                    constant:0];
    
    NSLayoutConstraint *resetH = [NSLayoutConstraint
                                  constraintWithItem:self.resetButton3
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:self.mainScrollView 
                                  attribute:NSLayoutAttributeHeight
                                  multiplier:0.1
                                  constant:0];
    NSLayoutConstraint *resetW = [NSLayoutConstraint
                                  constraintWithItem:self.resetButton3
                                  attribute:NSLayoutAttributeWidth
                                  relatedBy:NSLayoutRelationEqual
                                  toItem:self.stitchCountWindow3
                                  attribute:NSLayoutAttributeWidth
                                  multiplier:1
                                  constant:0];
    
    NSLayoutConstraint *resetAlignRight = [NSLayoutConstraint constraintWithItem:self.resetButton3
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.stitchCountWindow3
                                                                       attribute:NSLayoutAttributeTrailing
                                                                      multiplier:1.0
                                                                        constant:0];
    
    NSLayoutConstraint *detailsAlignLeft = [NSLayoutConstraint constraintWithItem:self.detailsWindow3
                                                                        attribute:NSLayoutAttributeLeading
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.stitchCountWindow3
                                                                        attribute:NSLayoutAttributeLeading
                                                                       multiplier:1.0
                                                                         constant:0];
    
    
    [self.mainScrollView addConstraint:detailsH];
    [self.mainScrollView addConstraint:detailsW];
    [self.mainScrollView addConstraint:detailsAlignLeft];
    [self.mainScrollView addConstraint:resetAlignRight];
    [self.mainScrollView addConstraint:resetH];
    [self.mainScrollView addConstraint:resetW];
    
    
    NSArray *constraint_POS_Vdetails =[NSLayoutConstraint constraintsWithVisualFormat:@"V:[stitchCount]-vSpacing-[details]"
                                                                              options:0
                                                                              metrics:metricsDict
                                                                                views:viewsDict];
    [self.mainScrollView addConstraints:constraint_POS_Vdetails];
    
    
    NSArray *constraint_POS_Vreset =[NSLayoutConstraint constraintsWithVisualFormat:@"V:[details]-vSpacing-[reset]"
                                                                            options:0
                                                                            metrics:metricsDict
                                                                              views:viewsDict];
    [self.mainScrollView addConstraints:constraint_POS_Vreset];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
