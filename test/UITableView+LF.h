//
//  UITableView+LF.h
//  test
//
//  Created by mac on 17/07/05.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (LF)<UIScrollViewDelegate>
@property (nonatomic, assign) BOOL boolProperty;

-(void)lf_reloadData;
@end
