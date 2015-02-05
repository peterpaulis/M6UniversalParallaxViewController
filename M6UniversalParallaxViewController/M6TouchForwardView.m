//
//  TouchForwardView.m
//  Streams
//
//  Created by Peter Paulis on 05/02/15.
//  Copyright (c) 2015 min60 s.r.o. - Peter Paulis. All rights reserved.
//

#import "M6TouchForwardView.h"

@implementation M6TouchForwardView

-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self) {
        return self.forwardView;
    } else {
        return hitView;
    }
}

@end
