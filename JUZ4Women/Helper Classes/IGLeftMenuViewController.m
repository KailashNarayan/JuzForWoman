//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "IGLeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "MMDrawerController+Subclass.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "LeftMenuCellTableViewCell.h"
//#import "IGPlayersInfoViewController.h"
#import "JFWAppDelegate.h"
#import "UIViewController+MMDrawerController.h"



@implementation IGLeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    self.title = @"Player List";
	
	self.tableView.separatorColor = [UIColor lightGrayColor];
    
    UIImageView *imageViewObj = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, self.tableView.frame.size.height)];
    imageViewObj.image = [UIImage imageNamed:@"swipe_menu_bg.png"];
	
//	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swipe_menu_bg.png"]];
	self.tableView.backgroundView = imageViewObj;
	
	self.view.layer.borderWidth = .6;
	self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 6;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"LeftMenuCellTableViewCell";

    
    LeftMenuCellTableViewCell *cell = (LeftMenuCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[LeftMenuCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LeftMenuCellTableViewCell" owner:self options:nil];
        cell =  (LeftMenuCellTableViewCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
//        cell.contentView.backgroundColor = [UIColor colorWithRed:14/255.0 green:63/255.0 blue:109/255.0 alpha:1];
        
        
    }
    cell.borderImageView.image = [UIImage imageNamed:@"devider.png"];
	
	switch (indexPath.row)
	{
        case 0:
            cell.descriptionLabel.text = @"Home";
            cell.cellImageView.image = [UIImage imageNamed:@"icon_home.png"];
            break;
            
		case 1:
			cell.descriptionLabel.text = @"Players Info";
            cell.cellImageView.image = [UIImage imageNamed:@"icon_player-_nfo.png"];
			break;
			
		case 2:
			cell.descriptionLabel.text = @"Team History";
            cell.cellImageView.image = [UIImage imageNamed:@"icon_team_history.png"];
			break;
			
		case 3:
			cell.descriptionLabel.text = @"Stadium History";
            cell.cellImageView.image = [UIImage imageNamed:@"icon_stadium.png"];
			break;
			
		case 4:
			cell.descriptionLabel.text = @"Ticket Details";
            cell.cellImageView.image = [UIImage imageNamed:@"icon_ticket.png"];
			break;
        case 5:
            cell.descriptionLabel.text = @"Feedback";
            cell.cellImageView.image = [UIImage imageNamed:@"icon_feedback.png"];
            break;
        
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UIViewController *viewControllerObj ;
	
	switch (indexPath.row)
	{
        case 0:
        {
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"IGHomeViewController"];
            break;
        }

					
		
        case 3:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"IGStadiumHistoryViewController"];
            break;
        case 4:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"IGTicketDetailViewController"];
            break;
        case 5:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"IGFeedbackViewController"];
            break;
			
		
			
	
}
    UINavigationController *navControllerObj = [[UINavigationController alloc]initWithRootViewController:viewControllerObj];
    [self.mm_drawerController setCenterViewController:navControllerObj withCloseAnimation:YES completion:nil];
}

@end
