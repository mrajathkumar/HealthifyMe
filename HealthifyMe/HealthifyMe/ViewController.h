//
//  ViewController.h
//  HealthifyMe
//
//  Created by Rajath Kumar on 24/03/16.
//  Copyright (c) 2016 Rajath Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalEatenTableViewCell.h"
#import "CalEatenDropDownTableViewCell.h"
#import "CalBurntTableViewCell.h"
#import "CalBurntDropDownTableViewCell.h"
#import "KGSLostTableViewCell.h"
#import "KGSLostDropDownTableViewCell.h"
#import "DietPlanTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    UIImageView *ImgScrollImage;
}

@property (strong, nonatomic) NSMutableArray *optionArray, *slidesArray;
@property (weak, nonatomic) IBOutlet UITableView *caloriesTableView;

- (IBAction)onClickMenuButton:(id)sender;
- (IBAction)onClickBackDateButton:(id)sender;

@end

