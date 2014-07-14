//
//  StitchCountView.h
//  testingAutoLayout
//
//  Created by Jennifer Louie on 7/10/14.
//  Copyright (c) 2014 Jennifer Louie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StitchCountView;

@protocol StitchCountViewDelegate <NSObject>
- (void)stitchCountViewIncrementCount:(StitchCountView *)stitchCountView;
- (void)stitchCountViewDecrementCount:(StitchCountView *)stitchCountView;
@end

@interface StitchCountView : UIView

-(void)addStitchCountSubviews;
-(void)updateStitchCount: (double)stitchesToDo;
-(void)updateBannerInfo: (double)stitchesToDo comparedToTotal: (double)total withDecrement:(BOOL)frog;
-(void)resetBannerInfo;

@property (nonatomic, assign) id<StitchCountViewDelegate>delegate;
@end
