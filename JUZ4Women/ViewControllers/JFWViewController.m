//
//  ViewController.m
//  JUZ4Women
//
//  Created by Kailash on 4/29/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "JFWViewController.h"
#import "IGLeftMenuViewController.h"
#import "IGHomeViewController.h"
#import "JFWAppDelegate.h"
#import "MMDrawerController.h"
#import "MMExampleCenterTableViewController.h"
#import "MMExampleLeftSideDrawerViewController.h"
#import "MMExampleRightSideDrawerViewController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "MMNavigationController.h"

static BOOL OSVersionIsAtLeastiOS7() {
    return (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1);
}

@interface JFWViewController ()

@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation JFWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onButtonTapped:(id)sender
{
    IGHomeViewController *beaconSearchViewControllerObj = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    IGLeftMenuViewController *leftSideDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    
    UIViewController * rightSideDrawerViewController = [[MMExampleRightSideDrawerViewController alloc] init];
    
    UINavigationController * navigationController = [[MMNavigationController alloc] initWithRootViewController:beaconSearchViewControllerObj];
    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    if(OSVersionIsAtLeastiOS7()){
        UINavigationController * rightSideNavController = [[MMNavigationController alloc] initWithRootViewController:rightSideDrawerViewController];
        [rightSideNavController setRestorationIdentifier:@"MMExampleRightNavigationControllerRestorationKey"];
        //        UINavigationController * leftSideNavController = [[MMNavigationController alloc] initWithRootViewController:leftSideDrawerViewController];
        //        [leftSideNavController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:nil];
        [self.drawerController setShowsShadow:NO];
    }
    else{
        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:navigationController
                                 leftDrawerViewController:leftSideDrawerViewController
                                 rightDrawerViewController:rightSideDrawerViewController];
    }
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    JFWAppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if(OSVersionIsAtLeastiOS7()){
        UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                              green:173.0/255.0
                                               blue:234.0/255.0
                                              alpha:1.0];
        //[self.window setTintColor:tintColor];
    }
    [delegate.window setRootViewController:self.drawerController];

}
@end
