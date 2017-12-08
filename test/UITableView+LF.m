//
//  UITableView+LF.m
//  test
//
//  Created by mac on 17/07/05.
//  Copyright © 2017年 mac. All rights reserved.
//
#import <objc/runtime.h>
#import "UITableView+LF.h"
static char const * const boolPropertyKey;
@implementation UITableView (LF)

#pragma mark - BOOL类型的动态绑定

-(void)setBoolProperty:(BOOL)boolProperty{
    
     objc_setAssociatedObject(self, boolPropertyKey, [NSNumber numberWithBool:boolProperty], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}






- (BOOL)boolProperty {
    return [objc_getAssociatedObject(self, boolPropertyKey) boolValue];
}


//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    scrollview = YES;
//
//}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.boolProperty = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.boolProperty = NO;
    
}
-(void)lf_reloadData{
    
    self.boolProperty = YES;
    [self reloadData];
}


@end
