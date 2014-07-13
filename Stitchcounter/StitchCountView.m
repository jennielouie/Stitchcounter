//
//  StitchCountView.m
//  testingAutoLayout
//
//  Created by Jennifer Louie on 7/10/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import "StitchCountView.h"


@interface StitchCountView()

@property (strong, nonatomic) UILabel *stitchesLeft;
@property (strong, nonatomic) UIButton *addStitch;
@property (strong, nonatomic) UIButton *delStitch;
@property (weak, nonatomic) UIStepper *stepper;
@end

@implementation StitchCountView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)addStitchCountSubviews
{
    
    self.stitchesLeft = [[UILabel alloc] init];
    self.stitchesLeft.translatesAutoresizingMaskIntoConstraints = NO;
    self.stitchesLeft.text = @"17 to go";
    self.stitchesLeft.textColor = [UIColor purpleColor];
    self.stitchesLeft.backgroundColor = [UIColor whiteColor];
    self.stitchesLeft.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.stitchesLeft];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stitchesLeft
                                                                        attribute:NSLayoutAttributeCenterX
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeCenterX
                                                                       multiplier:1.0
                                                                         constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.stitchesLeft
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.0
                                                                          constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.stitchesLeft
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                       multiplier:0.4
                                                                         constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.stitchesLeft
                                                                         attribute:NSLayoutAttributeWidth
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self
                                                                         attribute:NSLayoutAttributeWidth
                                                                        multiplier:0.4
                                                                          constant:0]];
    
    
    self.addStitch = [UIButton new];
    self.addStitch.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addStitch setTitle:@"did one!" forState:UIControlStateNormal];
    [self.addStitch setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.addStitch setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self addSubview:self.addStitch];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addStitch
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.5
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addStitch
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.7
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.addStitch
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.1
                                                      constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.addStitch
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeWidth
                                                     multiplier:0.3
                                                       constant:0]];
    
    
    self.delStitch = [UIButton new];
    self.delStitch.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.delStitch setTitle:@"oops!" forState:UIControlStateNormal];
    [self.delStitch setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.delStitch setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self addSubview:self.delStitch];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.delStitch
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:0.5
                                                      constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.delStitch
                                                      attribute:NSLayoutAttributeCenterY
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeCenterY
                                                     multiplier:1.7
                                                       constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.delStitch
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.1
                                                      constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.delStitch
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeWidth
                                                     multiplier:0.3
                                                       constant:0]];
}

@end
