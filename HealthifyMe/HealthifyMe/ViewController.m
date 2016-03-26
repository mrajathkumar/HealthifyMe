//
//  ViewController.m
//  HealthifyMe
//
//  Created by Rajath Kumar on 24/03/16.
//  Copyright (c) 2016 Rajath Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int calEatenRow;
    int calBurntRow;
    int KGSLostRow;
    int scrollWidth;
    BOOL calEatenExpanded;
    BOOL calBurntExpanded;
    BOOL KGSLostExpanded;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.optionArray = [[NSMutableArray alloc]initWithObjects:@"Cal Eaten",@"Cal Burnt",@"KG'S Lost",@"Diet Plan", nil];
    
    scrollWidth=0;
    self.slidesArray = [[NSMutableArray alloc] initWithObjects:@"slide4", @"slide3", @"slide2", @"slide1", nil];
    
    [self.caloriesTableView reloadData];
}


#pragma TableView Delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.optionArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (section==0)
    {
        return calEatenRow+1; // return rows when expanded
    }
    else if (section==1)
    {
        return calBurntRow+1; // return rows when expanded
    }
    else if (section==2)
    {
        return KGSLostRow+1; // return rows when expanded
    }
    else
    return 1;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if(indexPath.row==0)
    {
        if (indexPath.section==3)
        {
            return 200.00;
        }
        else
        {
            return 100.00;
        }
    }
    else if (indexPath.section==0)
    {
        if (indexPath.row==1)
        {
            return 200.00;
        }
        
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==1)
        {
            return 200.00;
        }
    }
    else if (indexPath.section==2)
    {
        if (indexPath.row==1)
        {
            return 200.00;
        }
    }
    else
    {
        return 100.00;
        
    }
    
    return 0.0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(!indexPath.row)
    {
        if (indexPath.section==3)
            
        {
            DietPlanTableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"DietPlanTableViewCell" forIndexPath:indexPath];
            
            cell.dietPlanView.layer.borderWidth = 0.5;
            cell.dietPlanView.layer.borderColor = [UIColor grayColor].CGColor;
            cell.dietPlanView.layer.cornerRadius = 5.0f;
            [cell.dietPlanView setClipsToBounds:YES];
    
            
            return cell;
        }
        else
        {
            CalEatenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalEatenTableViewCell" forIndexPath:indexPath];
            
            cell.categoryLabel.text=[self.optionArray objectAtIndex:indexPath.section];
            
            UIView *selectionview=[[UIView alloc]initWithFrame:cell.bounds];
            selectionview.backgroundColor=[UIColor colorWithRed:(2/255.0) green:(127/255.0) blue:(219/255.0) alpha:1.0];
            cell.selectedBackgroundView=selectionview;
            
            
            cell.addButton.tag=indexPath.row;
            [cell.addButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
            return cell;
            
        }
    }
    else if (indexPath.row==1)
    {
        if (indexPath.section==0)
        {
            CalEatenDropDownTableViewCell  *cell = [tableView  dequeueReusableCellWithIdentifier:@"CalEatenDropDownTableViewCell" forIndexPath:indexPath];
            
            
            cell.calEatenScrollView.contentSize = CGSizeMake(cell.calEatenScrollView.frame.size.width*self.slidesArray.count, cell.calEatenScrollView.frame.size.height);
            
            
            for (int i=0; i<self.slidesArray.count; i++)
            {
                ImgScrollImage = [[UIImageView alloc]initWithFrame:CGRectMake(cell.calEatenScrollView.frame.size.width*i, cell.calEatenScrollView.frame.origin.y, cell.calEatenScrollView.frame.size.width, cell.calEatenScrollView.frame.size.height)];
                
                [cell.calEatenScrollView addSubview:ImgScrollImage];
                
                NSLog(@"NSStringFromCGRect:%@", NSStringFromCGRect(cell.calEatenScrollView.frame));
                
                
                cell.calEatenScrollView.delegate = self;
                [cell.calEatenPageControl setNumberOfPages:self.slidesArray.count];
                cell.calEatenPageControl.currentPage=0;
                
                [ImgScrollImage setImage:[UIImage imageNamed:[self.slidesArray objectAtIndex:i]]];
            }
            
            
            return cell;
        }
        else if (indexPath.section==1)
        {
            CalBurntDropDownTableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"CalBurntDropDownTableViewCell" forIndexPath:indexPath];
            
            
            cell.calBurntScrollView.contentSize = CGSizeMake(cell.calBurntScrollView.frame.size.width*self.slidesArray.count, cell.calBurntScrollView.frame.size.height);
            
            
            for (int i=0; i<self.slidesArray.count; i++)
            {
                ImgScrollImage = [[UIImageView alloc]initWithFrame:CGRectMake(cell.calBurntScrollView.frame.size.width*i, cell.calBurntScrollView.frame.origin.y, cell.calBurntScrollView.frame.size.width, cell.calBurntScrollView.frame.size.height)];
                
                [cell.calBurntScrollView addSubview:ImgScrollImage];
                
                NSLog(@"NSStringFromCGRect:%@", NSStringFromCGRect(cell.calBurntScrollView.frame));
                
                
                cell.calBurntScrollView.delegate = self;
                [cell.calBurntPageControl setNumberOfPages:self.slidesArray.count];
                cell.calBurntPageControl.currentPage=0;
                
                [ImgScrollImage setImage:[UIImage imageNamed:[self.slidesArray objectAtIndex:i]]];
            }
            
            
            return cell;
        }
        else if (indexPath.section==2)
        {
            KGSLostDropDownTableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"KGSLostDropDownTableViewCell" forIndexPath:indexPath];
            
            return cell;
        }
    }
  

    
    CalEatenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalEatenTableViewCell" forIndexPath:indexPath];
    
    cell.categoryLabel.text=[self.optionArray objectAtIndex:indexPath.section];
    
    
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section==0)
    {
        if (calEatenExpanded)
        {
            if (indexPath.row==1)
            {
                return NO;
            }
        }
        else
        {
            return YES;
        }
    }
    else if(indexPath.section==1)
    {
        if (calBurntExpanded)
        {
            if (indexPath.row==1)
            {
                return NO;
            }
        }
        else
        {
            return YES;
        }
    }
    else if (indexPath.section==2)
    {
        if (KGSLostRow)
        {
            if (indexPath.row==1)
            {
                return NO;
            }
        }
        else
        {
            return YES;
        }
    }

    
    return YES;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CalEatenTableViewCell *cell=(CalEatenTableViewCell*)[self.caloriesTableView cellForRowAtIndexPath:indexPath];
    
    if(indexPath.section==0)
    {
        if (calEatenExpanded)
        {
            calEatenRow=0;
            calBurntRow=0;
            KGSLostRow=0;
            calEatenExpanded=0;
            
            [cell.arrowImageView setImage:[UIImage imageNamed:@"nav"]];
            
        }
        else
        {
            calEatenRow=1;
            calBurntRow=0;
            KGSLostRow=0;
            calEatenExpanded=1;
            
            [cell.arrowImageView setImage:[UIImage imageNamed:@"nav-down"]];
            
        }
        
    }
    else if (indexPath.section==1){
        
        if (calBurntExpanded)
        {
            calEatenRow=0;
            calBurntRow=0;
            KGSLostRow=0;
            calBurntExpanded=0;
            
            [cell.arrowImageView setImage:[UIImage imageNamed:@"nav"]];
        }
        else
        {
            calBurntRow=1;
            calEatenRow=0;
            KGSLostRow=0;
            calBurntExpanded=1;
            
            [cell.arrowImageView setImage:[UIImage imageNamed:@"nav-down"]];
        }
    }
    else if (indexPath.section==2)
    {
        if (KGSLostExpanded)
        {
            calEatenRow=0;
            calBurntRow=0;
            KGSLostRow=0;
            KGSLostExpanded=0;
            
            [cell.arrowImageView setImage:[UIImage imageNamed:@"nav"]];
        }
        else
        {
            KGSLostRow=1;
            KGSLostExpanded=0;
            calBurntRow=0;
            KGSLostExpanded=1;
            
           [cell.arrowImageView setImage:[UIImage imageNamed:@"nav-down"]];
        }
    }
    
    
    [self.caloriesTableView reloadData];
}


-(void) buttonTapped:(UIButton *)sender
{
   
}


#pragma ScrollView Delegate Method

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    NSIndexPath *indexpath1=[NSIndexPath indexPathForRow:1 inSection:0];
    CalEatenDropDownTableViewCell *cellHeader1 = (CalEatenDropDownTableViewCell *)[self.caloriesTableView cellForRowAtIndexPath:indexpath1];
    
    NSIndexPath *indexpath2=[NSIndexPath indexPathForRow:1 inSection:1];
    CalBurntDropDownTableViewCell *cellHeader2 = (CalBurntDropDownTableViewCell *)[self.caloriesTableView cellForRowAtIndexPath:indexpath2];
    
    CGFloat pageWidth = _scrollView.frame.size.width;
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    //    int page = floor(_scrollView.contentOffset.x / pageWidth);

    [cellHeader1.calEatenPageControl setCurrentPage:page];
    [cellHeader2.calBurntPageControl setCurrentPage:page];
    
    //   NSLog(@"LoginpageControl.currentPage:%ld", (long)cellHeader.calEatenPageControl.currentPage);
    
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onClickMenuButton:(id)sender {
}

- (IBAction)onClickBackDateButton:(id)sender {
}
@end
