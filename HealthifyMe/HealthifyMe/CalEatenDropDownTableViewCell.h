//
//  CalEatenDropDownTableViewCell.h
//  HealthifyMe
//
//  Created by mahesh on 25/03/16.
//  Copyright © 2016 Rajath Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalEatenDropDownTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIScrollView *calEatenScrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *calEatenPageControl;

@end
