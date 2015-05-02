//
//  HomeViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "IGHomeViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "IGLeftMenuViewController.h"
#import <CoreLocation/CoreLocation.h>
//#import "UIImage+animatedGIF.h"
#import "IGHomeViewCellTableViewCell.h"
#import "UIViewController+MMDrawerController.h"
#import "JFWAppDelegate.h"


@interface IGHomeViewController()
{
   
    NSString *databasePath;
    NSMutableArray *cellImageArray;
    UITableView *tableView;
    UIView *notificationView;
    UILabel *messageLabel;
}


@end

@implementation IGHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self commanInit];
    self.title = @"Home";
}

-(void)viewWillAppear:(BOOL)animated
{
    //[self configureTableView];
}

-(void)commanInit
{
    [self configureNavBarTitile];
    //[self initilizeManagers];
    //[self setSearchBeaconImage];
    //[self startScanningBeacons];
    [self configureLeftNavBar];
    cellImageArray = [[NSMutableArray alloc]init];
}
-(void)configureNavBarTitile
{
    //self.title = @"Product Details";
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

-(void)configureLeftNavBar
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightButton.frame = CGRectMake(0, 0, 30, 30);
    
    [rightButton setImage:[UIImage imageNamed:@"menu_icon.png"] forState:UIControlStateNormal];
    
     [rightButton addTarget:self action:@selector(onNavBarButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

}

-(void)onNavBarButtonTapped
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
	return NO;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
	return NO;
}


//-(void)initilizeManagers
//{
//    self.navigationController.navigationBar.translucent = NO;
//    self.bleManagerObj = [[IGBLEManager alloc]init];
//    self.bleManagerObj.delegate = self;
//    
//    self.dataManagerObj = [[IGDataManager alloc]init];
//    
//     NSMutableArray *beaconDataArray = [self.dataManagerObj getBeaconData];
//    
//    NSMutableArray *seatInfoArray = [self.dataManagerObj getSeatInfo];
//    
//    [self createDatabase];
//    
//    [[DatabaseManager getInstance] storeBeaconInfo:beaconDataArray];
//    [[DatabaseManager getInstance] storeSeatsInfo:seatInfoArray];
//
//}



#pragma mark - TableView delegate methods
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Returning height of row
//    if(indexPath.row == 3 || indexPath.row == 1)
//    {
//        return 70;
//    }
    return 250;
}

- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if(indexPath.row == 3 || indexPath.row == 1)
//    {
//        return 70;
//    }
    return 250;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Returning no of section in tableview
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    //Intilizing footerview for table and returning it
    UIView *footerView = [UIView new];
    
    return footerView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Returing number of rows in section of tableview

    return cellImageArray.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    //Intilizing the table cell
    static NSString* cellIdentifier = @"cellIdentifier";
    
    IGHomeViewCellTableViewCell *cell = (IGHomeViewCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[IGHomeViewCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"IGHomeViewCellTableViewCell" owner:self options:nil];
        cell =  (IGHomeViewCellTableViewCell *)[topLevelObjects objectAtIndex:0];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        cell.contentView.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
        cell.borderImageView.image = [UIImage imageNamed:@"devider_gray.png"];
    }
    
//    static NSString* descriptionCellIdentifier = @"DescriptionCell";
//    
//    IGHomeViewDescriptionCellTableViewCell *descriptionCell = (IGHomeViewDescriptionCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:descriptionCellIdentifier];
    
//    if (descriptionCell == nil)
//    {
//        descriptionCell = [[IGHomeViewDescriptionCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:descriptionCellIdentifier];
//        
//        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"IGHomeViewDescriptionCellTableViewCell" owner:self options:nil];
//        descriptionCell =  (IGHomeViewDescriptionCellTableViewCell *)[topLevelObjects objectAtIndex:0];
//        
//        [descriptionCell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        
//        descriptionCell.contentView.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
//        
//        descriptionCell.borderImageView.image = [UIImage imageNamed:@"devider_gray.png"];
//
//    }
   // 26 ,54, 118
    
    //descriptionCell.descriptionLabel.text = @"Hello cell";

    
    //Setting the label text on cell
    
        //cell.offerLabel.text = @"Sprots Title";
    
    
        
    //Setting the background color of cell
    cell.backgroundColor = [UIColor colorWithRed:219.0/255 green:219.0/255 blue:219.0/255 alpha:1];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}


@end
