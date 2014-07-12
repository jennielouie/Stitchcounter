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
@end

@implementation Prog2ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    [self addRules];
    // Do any additional setup after loading the view.
}


- (void)setupViews
{
    self.stitchCountWindow3 = [StitchCountView new];
    self.stitchCountWindow3.translatesAutoresizingMaskIntoConstraints = NO;
    self.stitchCountWindow3.backgroundColor = [UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0];
    [self.view addSubview:self.stitchCountWindow3];
    [self.stitchCountWindow3 addStitchCountSubviews];
    
    self.detailsWindow3 = [DetailView new];
    self.detailsWindow3.translatesAutoresizingMaskIntoConstraints = NO;
    self.detailsWindow3.backgroundColor = [UIColor colorWithRed:1.00 green:0.83 blue:0.58 alpha:1.0];
    [self.view addSubview:self.detailsWindow3];
    [self.detailsWindow3 addDetailSubviews];
    
    self.resetButton3 = [UIButton new];
    self.resetButton3.translatesAutoresizingMaskIntoConstraints = NO;
    self.resetButton3.backgroundColor = [UIColor clearColor];
    [self.resetButton3 setTitle:@"Reset Counters" forState:UIControlStateNormal];
    [self.resetButton3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.resetButton3 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.view addSubview:self.resetButton3];
    
}

-(void)addRules
{
    NSDictionary *viewsDict = @{@"stitchCount":self.stitchCountWindow3, @"details":self.detailsWindow3, @"reset":self.resetButton3};
    NSDictionary *metricsDict = @{@"vSpacing":@20,@"hSpacing":@10};
    
    NSArray *constraint_POS_V =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpacing-[stitchCount]"
                                                                       options:0
                                                                       metrics:metricsDict
                                                                         views:viewsDict];
    [self.view addConstraints:constraint_POS_V];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.stitchCountWindow3
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:0.8
                              constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.stitchCountWindow3
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.6
                              constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.stitchCountWindow3
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    NSLayoutConstraint *detailsH = [NSLayoutConstraint
                                    constraintWithItem:self.detailsWindow3
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                    attribute:NSLayoutAttributeHeight
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
                                  toItem:self.view
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
    
    
    [self.view addConstraint:detailsH];
    [self.view addConstraint:detailsW];
    [self.view addConstraint:detailsAlignLeft];
    [self.view addConstraint:resetAlignRight];
    [self.view addConstraint:resetH];
    [self.view addConstraint:resetW];
    
    
    NSArray *constraint_POS_Vdetails =[NSLayoutConstraint constraintsWithVisualFormat:@"V:[stitchCount]-vSpacing-[details]"
                                                                              options:0
                                                                              metrics:metricsDict
                                                                                views:viewsDict];
    [self.view addConstraints:constraint_POS_Vdetails];
    
    
    NSArray *constraint_POS_Vreset =[NSLayoutConstraint constraintsWithVisualFormat:@"V:[details]-vSpacing-[reset]"
                                                                            options:0
                                                                            metrics:metricsDict
                                                                              views:viewsDict];
    [self.view addConstraints:constraint_POS_Vreset];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end