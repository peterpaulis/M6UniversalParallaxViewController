//
//  HeaderInsetTableView.h
//  Sample
//
//  Created by Peter Paulis on 09/08/14.
//  Copyright (c) 2014 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import <UIKit/UIKit.h>

// inspired by http://b2cloud.com.au/tutorial/uitableview-section-header-positions/

@interface M6HeaderInsetTableView : UITableView

@property (nonatomic, assign) UIEdgeInsets headerViewInsets;

@end