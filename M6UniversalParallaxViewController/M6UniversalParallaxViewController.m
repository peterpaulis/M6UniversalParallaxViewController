//
//  M6ParallaxTableViewController.m
//  M6ParallaxTableViewController
//
//  Created by Peter Paulis on 1.4.2013.
//  Copyright (c) 2013 Min60 s.r.o. - http://min60.com. All rights reserved.
//

#import "M6UniversalParallaxViewController.h"

@interface M6UniversalParallaxViewController ()

@property (nonatomic, assign) CGFloat parallaxViewContainerRestingHeight;

@end

@implementation M6UniversalParallaxViewController

@synthesize parallaxViewContainerRestingHeight = _parallaxViewContainerRestingHeight;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // pramatere control
    {
        NSAssert(self.parallaxContainerView, @"parallaxContainerView outlet cannot be nil");
        NSAssert(self.scrollView, @"scrollView outlet cannot be nil");
        NSAssert(self.parallaxView, @"parallaxView outlet cannot be nil");
        NSAssert(self.parallaxContainerViewHeightLayoutConstraint, @"parallaxContainerViewHeightLayoutConstraint outlet cannot be nil");
    }
    
    [self.parallaxContainerView setClipsToBounds:YES];
    
    self.scrollView.delegate = self;
    
    self.parallaxViewContainerRestingHeight = self.parallaxContainerViewHeightLayoutConstraint.constant;
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Override
////////////////////////////////////////////////////////////////////////

- (void)parallaxViewContainerHeightWillChange:(CGFloat)newHeight fromOldHeight:(CGFloat)height {

}

- (void)setParallaxViewContainerRestingHeight:(CGFloat)parallaxViewContainerRestingHeight {

    _parallaxViewContainerRestingHeight = parallaxViewContainerRestingHeight;
    
    // adjust for new resting height
    [self createTableHeaderView];
    
}

- (void)setMinimumHeight:(CGFloat)minimumHeight {
    
    _minimumHeight = minimumHeight;
    
    self.scrollView.contentInset = UIEdgeInsetsMake(_minimumHeight, 0, 0, 0);
    
    [self createTableHeaderView];
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Private
////////////////////////////////////////////////////////////////////////

- (void)createTableHeaderView {
    
    if ([self.scrollView isKindOfClass:[UITableView class]]) {
        
        UITableView * tv = (UITableView *)self.scrollView;
        UIView * hv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tv.bounds.size.width, self.parallaxViewContainerRestingHeight - self.minimumHeight)];
        tv.tableHeaderView = hv;
    }
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - UIScrollViewDelegate
////////////////////////////////////////////////////////////////////////

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView != self.scrollView) {
        return;
    }
    
    CGFloat y = self.scrollView.contentOffset.y + self.parallaxViewContainerRestingHeight;
    
    if ([self.scrollView isKindOfClass:[UITableView class]]) {
     
        UITableView * tv = (UITableView *)self.scrollView;
        y -= tv.tableHeaderView.frame.size.height;// + self.scrollView.contentInset.top;

    }
    
    if (y > 0) {
        
        CGFloat newHeight = MAX(self.minimumHeight, self.parallaxViewContainerRestingHeight - y);
        
        [self.parallaxContainerView setHidden:(newHeight <= 0)];
        
        if (!self.parallaxContainerView.hidden) {
            
            [self parallaxViewContainerHeightWillChange:newHeight fromOldHeight:self.parallaxContainerViewHeightLayoutConstraint.constant];
            
            self.parallaxContainerViewHeightLayoutConstraint.constant = newHeight;
            
            [self.parallaxContainerView layoutIfNeeded];
        
        }
        
    } else {
        
        [self.parallaxContainerView setHidden:NO];
        
        CGFloat newHeight = MAX(self.minimumHeight, self.parallaxViewContainerRestingHeight - y);
        
        [self parallaxViewContainerHeightWillChange:newHeight fromOldHeight:self.parallaxContainerViewHeightLayoutConstraint.constant];
        
        self.parallaxContainerViewHeightLayoutConstraint.constant = newHeight;
        
        [self.parallaxContainerView layoutIfNeeded];
        
    }
    
    [self.scrollView setShowsVerticalScrollIndicator:self.parallaxContainerView.hidden];

}

@end
