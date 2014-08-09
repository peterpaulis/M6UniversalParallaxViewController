//
//  HeaderInsetTableView.m
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "M6HeaderInsetTableView.h"

@interface M6HeaderInsetTableView ()

@property (nonatomic, assign) BOOL shouldManuallyLayoutHeaderViews;

@end

@implementation M6HeaderInsetTableView

- (void)layoutSubviews {
    
	[super layoutSubviews];
	
	if (self.shouldManuallyLayoutHeaderViews) {
		[self layoutHeaderViews];
    }
}

- (void)setHeaderViewInsets:(UIEdgeInsets)headerViewInsets {
    
	_headerViewInsets = headerViewInsets;
	
	self.shouldManuallyLayoutHeaderViews = !UIEdgeInsetsEqualToEdgeInsets(headerViewInsets, UIEdgeInsetsZero);
	
	[self setNeedsLayout];
}

- (void)layoutHeaderViews {
    
	const NSUInteger numberOfSections = self.numberOfSections;
	const UIEdgeInsets contentInset = self.contentInset;
	const CGPoint contentOffset = self.contentOffset;
	
	const CGFloat sectionViewMinimumOriginY = contentOffset.y + contentInset.top + self.headerViewInsets.top;
	
	for (NSUInteger section = 0; section < numberOfSections; section++) {
        
		UIView * sectionView = [self headerViewForSection:section];
		
		if (sectionView == nil) {
			continue;
		}
        
		const CGRect sectionFrame = [self rectForSection:section];
		
		CGRect sectionViewFrame = sectionView.frame;
		
		sectionViewFrame.origin.y = ((sectionFrame.origin.y < sectionViewMinimumOriginY) ? sectionViewMinimumOriginY : sectionFrame.origin.y);
		
		//	if its not the last section, manually stick it
		if (section < numberOfSections - 1) {
            
			const CGRect nextSectionFrame = [self rectForSection:section + 1];
			
			if (CGRectGetMaxY(sectionViewFrame) > CGRectGetMinY(nextSectionFrame)) {
				sectionViewFrame.origin.y = nextSectionFrame.origin.y - sectionViewFrame.size.height;
            }
		}
		
		[sectionView setFrame:sectionViewFrame];
	}
    
}

@end
