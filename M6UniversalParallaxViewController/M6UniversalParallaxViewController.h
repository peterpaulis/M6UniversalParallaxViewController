//
//  M6ParallaxTableViewController.h
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface M6UniversalParallaxViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIView * parallaxContainerView;
@property (nonatomic, weak) IBOutlet UIScrollView * scrollView;
@property (nonatomic, weak) IBOutlet UIView * parallaxView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *parallaxContainerViewHeightLayoutConstraint;

// overrride for additional functionality
- (void)parallaxViewContainerHeightWillChange:(CGFloat)newHeight fromOldHeight:(CGFloat)height;

// no need to set manually, value set by default from NSLayoutConstraint constant
- (void)setParallaxViewContainerRestingHeight:(CGFloat)parallaxViewContainerRestingHeight;
- (CGFloat)parallaxViewContainerRestingHeight;

@end