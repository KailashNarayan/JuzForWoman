//
//  SignUpViewController.m
//  JUZ4Women
//
//  Created by Aakash sharma on 02/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIPageControl *pageControl;
    __weak IBOutlet UICollectionView *collectionViewObj;
    __weak IBOutlet UIButton *previousButton;
    __weak IBOutlet UIButton *nextButton;
    
}
- (IBAction)previousButtonTapped:(id)sender;

- (IBAction)nextButtonTapped:(id)sender;

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialiation Methods

-(void)initView
{
    [self configurePageControl];
    
    [self setScrollViewContentSize];
    
    [self configureNextButton];
}

-(void)configurePageControl
{
    
}

-(void)configureNextButton
{
    [nextButton setImageEdgeInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
}

#pragma mark - UI Button Event Methods

- (IBAction)previousButtonTapped:(id)sender {
}

- (IBAction)nextButtonTapped:(id)sender {
}

#pragma mark - Helper Mthods

-(void)setScrollViewContentSize
{
    [scrollView setContentSize:self.view.bounds.size];
}

@end
