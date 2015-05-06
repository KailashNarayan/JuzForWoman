//
//  SignUpViewController.m
//  JUZ4Women
//
//  Created by Aakash sharma on 02/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignUpViewCell.h"

#import "JFWAppConstants.h"

@interface SignUpViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SignUpViewCellDelegate>
{
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UIPageControl *pageControl;
    __weak IBOutlet UICollectionView *collectionViewObj;
    __weak IBOutlet UIButton *previousButton;
    __weak IBOutlet UIButton *nextButton;
    
    SignUpViewCell *signUpViewCellObj;
    
    SignUpOption signUpOption;
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
    
    [self registerCollectionViewCell];
    
    signUpOption = NONE;
}

-(void)configurePageControl
{
    
}

-(void)configureNextButton
{
    [nextButton setImageEdgeInsets:UIEdgeInsetsMake(2, 52, 0, 0)];
}

-(void)registerCollectionViewCell
{
    [collectionViewObj registerClass:[SignUpViewCell class] forCellWithReuseIdentifier:@"SignUpViewCellIdentifier"];
    
    [collectionViewObj registerNib:[UINib nibWithNibName:@"SignUpViewCell" bundle:nil] forCellWithReuseIdentifier:@"SignUpViewCellIdentifier"];
}

#pragma mark - Collection View DataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    signUpViewCellObj = [collectionView dequeueReusableCellWithReuseIdentifier:@"SignUpViewCellIdentifier" forIndexPath:indexPath];
    
    [signUpViewCellObj setSignUpScreenType:indexPath.row];
    [signUpViewCellObj setSignUpOption:signUpOption];
    
    [signUpViewCellObj setDataOnCell];

    if (indexPath.row == DATE_OF_BIRTH_SCREEN)
        [self showPreviousButon:NO];
    
    else
        [self showPreviousButon:YES];
    
    return signUpViewCellObj;
}

#pragma mark - CollectionView Delegate methods

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSIndexPath *indexPath = [self getCurrentVisibleIndexPath];
    
    if (indexPath && indexPath.row < 4)
    {
        [self setPageControl:indexPath.row];
    }
}

#pragma mark - UI Button Event Methods

- (IBAction)previousButtonTapped:(id)sender
{
    NSIndexPath *indexPath = [self getCurrentVisibleIndexPath];
    
    if (!indexPath)
        return;
    
    if (indexPath.row ==  0)
    {
        [self showPreviousButon:NO];
        return;
    }
    
    indexPath = [NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section];
    
     [collectionViewObj scrollToItemAtIndexPath:indexPath atScrollPosition:
      UICollectionViewScrollPositionCenteredVertically animated:YES];
}

- (IBAction)nextButtonTapped:(id)sender
{
    NSIndexPath *indexPath = [self getCurrentVisibleIndexPath];
    
    if (!indexPath)
        return;
    
    if (indexPath.row ==  3)
    {
        return;
    }
    
    indexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
    
    [collectionViewObj scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
}

#pragma mark - Helper Mthods

-(void)setScrollViewContentSize
{
    [scrollView setContentSize:self.view.bounds.size];
}

-(void)showPreviousButon:(BOOL)mode
{
    [previousButton setHidden:!mode];
}

-(void)showNextButon:(BOOL)mode
{
    [nextButton setHidden:!mode];
}

-(void)setPageControl:(NSInteger)page
{
    [pageControl setCurrentPage:page];
}

-(NSIndexPath *)getCurrentVisibleIndexPath
{
    NSIndexPath *indexPath = [collectionViewObj indexPathForCell:[[collectionViewObj visibleCells] firstObject]];
    
    return indexPath;
}

#pragma mark - SignUpViewCell Delegate Methods

-(void)disableNextButton:(BOOL)mode
{
    [nextButton setEnabled:mode];
}

-(void)signUpOptionSelected:(SignUpOption)option
{
    signUpOption = option;
}

@end
