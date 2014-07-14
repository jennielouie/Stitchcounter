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
@property (strong, nonatomic) UILabel *bannerInfo;
@property (strong, nonatomic) NSMutableArray *attaGirls; //of NSStrings
@end

@implementation StitchCountView


-(NSMutableArray *)attaGirls
{
    _attaGirls = [[NSMutableArray alloc] initWithObjects:@"Keep going!", @"You're doing great!", @"One step closer!", @"Awesome!", @"You're getting there!", @"Nice job!", nil];
    return _attaGirls;
}

-(NSString *)getRandomAttaGirl
{
    NSString *specificAttaGirl = nil;
    if ([self.attaGirls count])
    {
        unsigned index = arc4random()% self.attaGirls.count;
        specificAttaGirl = self.attaGirls[index];
    }
    return specificAttaGirl;
}

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

- (void)addStitchWasPressed
{
    [self.delegate stitchCountViewIncrementCount:self];
}



- (void)delStitchWasPressed
{
    [self.delegate stitchCountViewDecrementCount:self];
}

-(void)updateStitchCount: (double)stitchesToDo
{
    [_stitchesLeft  setText:[NSString stringWithFormat:@"%g to go", stitchesToDo]];
}


-(void)updateBannerInfo: (double)stitchesToDo comparedToTotal:(double)total
{
    NSString *bannerMessage;
    NSInteger numStitchesToDo = stitchesToDo;
    NSInteger numTotal = total;

    if (numStitchesToDo==0) {
        bannerMessage = @"Booya! All done";
    }
    else if(numStitchesToDo== numTotal)
    {
        bannerMessage = @"Let's get started";
    }
    else if (numStitchesToDo <0)
    {
        bannerMessage = @"Frogging needed!";
    } else{
        bannerMessage = [self getRandomAttaGirl]; 
    }
    self.bannerInfo.text= bannerMessage;
}



-(void)resetBannerInfo
{
    self.bannerInfo.text= @"Enter total rows required";
}

-(void)addStitchCountSubviews
{
    self.bannerInfo = [[UILabel alloc] init];
    self.bannerInfo.translatesAutoresizingMaskIntoConstraints = NO;
    self.bannerInfo.text = @"Enter total rows required";
    self.bannerInfo.textColor = [UIColor blackColor];
    self.bannerInfo.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.bannerInfo];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerInfo
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerInfo
                                                      attribute:NSLayoutAttributeCenterY
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeCenterY
                                                     multiplier:0.2
                                                       constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerInfo
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.1
                                                      constant:0]];
    
    [self  addConstraint:[NSLayoutConstraint constraintWithItem:self.bannerInfo
                                                      attribute:NSLayoutAttributeWidth
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeWidth
                                                     multiplier:1.0
                                                       constant:0]];
    
    
    self.stitchesLeft = [[UILabel alloc] init];
    self.stitchesLeft.translatesAutoresizingMaskIntoConstraints = NO;
    //self.stitchesLeft.text = @"17 to go";
    self.stitchesLeft.textColor = [UIColor blackColor];
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
    [self.addStitch setTitle:@"Did one!" forState:UIControlStateNormal];
    [self.addStitch setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.addStitch setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.addStitch addTarget:self action:@selector(addStitchWasPressed) forControlEvents:UIControlEventTouchUpInside];
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
    
    [self.delStitch setTitle:@"Oops!" forState:UIControlStateNormal];
    [self.delStitch setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.delStitch setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.delStitch addTarget:self action:@selector(delStitchWasPressed) forControlEvents:UIControlEventTouchUpInside];
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
