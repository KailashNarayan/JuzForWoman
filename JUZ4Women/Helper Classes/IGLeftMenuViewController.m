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
#import "JFWAppDelegate.h"
#import "UIViewController+MMDrawerController.h"
#import "JFWMenuItemModel.h"
#import "JFWAboutUsViewController.h"
#import "JFWArticleViewController.h"
#import "JFWPollsViewController.h"
#import "JFWPostViewController.h"
#import "JFWSignOutViewController.h"
#import "JFWVideoViewController.h"


@interface IGLeftMenuViewController()
{
    NSMutableArray *menuItemArray;
}

@end

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
    
      menuItemArray = [self createMenuItemArray];
    
    self.title = @"Player List";
	
	//self.tableView.separatorColor = [UIColor lightGrayColor];
    
    UIImageView *imageViewObj = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.tableView.frame.size.height)];
    imageViewObj.image = [UIImage imageNamed:@"app_back.png"];
    
    //self.view = imageViewObj;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"app_back.png"]];
	
	//self.tableView.backgroundView = imageViewObj;
	
//	self.view.layer.borderWidth = .6;
//	self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(!menuItemArray)
        return 0;
	return menuItemArray.count;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 20)];
//	view.backgroundColor = [UIColor clearColor];
//	return view;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//	return 20;
//}

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
        
        
    }
    cell.borderImageView.image = [UIImage imageNamed:@"devider.png"];
    cell.backgroundColor = [UIColor clearColor];
	
    [cell configureCellWith:[menuItemArray objectAtIndex:indexPath.row]];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UIViewController *viewControllerObj ;
	
	switch (indexPath.row)
	{
        case 0:
        {
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            break;
        }

        case 1:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWArticleViewController"];
            break;
        case 2:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWVideoViewController"];
            break;
        case 3:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWPollsViewController"];
            break;
        case 4:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWAboutUsViewController"];
            break;
        case 5:
            viewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"JFWSignOutViewController"];
            break;
			
		
			
	
}
    UINavigationController *navControllerObj = [[UINavigationController alloc]initWithRootViewController:viewControllerObj];
    [self.mm_drawerController setCenterViewController:navControllerObj withCloseAnimation:YES completion:nil];
}


-(NSMutableArray *)createMenuItemArray
{
    JFWMenuItemModel *menuItemModelObj1 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Post" withImageName:@"post_icon"];
    
    JFWMenuItemModel *menuItemModelObj2 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Article" withImageName:@"article_icon"];
    
    JFWMenuItemModel *menuItemModelObj3 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Videos" withImageName:@"video_icon"];
    
    JFWMenuItemModel *menuItemModelObj4 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Polls" withImageName:@"poll_icon"];
        
    JFWMenuItemModel *menuItemModelObj5 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"About Us" withImageName:@"about_us_icon"];
    
    
    JFWMenuItemModel *menuItemModelObj6 = [[JFWMenuItemModel alloc]initWithMenuItemName:@"Sign Out" withImageName:@"sign_out_icon"];
    
NSMutableArray *menuItemArray = [[NSMutableArray alloc]initWithObjects:menuItemModelObj1,menuItemModelObj2,menuItemModelObj3,menuItemModelObj4,menuItemModelObj5,menuItemModelObj6, nil];
    
    return menuItemArray;
}
@end
