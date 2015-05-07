//
//  SignUpViewCell.m
//  JUZ4Women
//
//  Created by Aakash sharma on 03/05/15.
//  Copyright (c) 2015 TTN Digital. All rights reserved.
//

#import "SignUpViewCell.h"


@implementation SignUpViewCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setDataOnCell
{
    [self showSignUpView];
}

-(void)showSignUpView
{
    switch (self.signUpScreenType)
    {
        case DATE_OF_BIRTH_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:YES];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:NO];
            
            break;
            
        case SIGNUP_OPTION_TYPE_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:YES];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:NO];
            
            break;
            
        case USERNAME_PASSWORD_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:YES];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:NO];
            
            [self setSignInPlaceHolderText];
            
            break;
            
        case SECURITY_CODE_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:YES];
            [self showView:selectCountryContainerView mode:NO];
            
            [self setSecurityCodeMessage];
            
            break;
            
        case LOCATION_SCREEN:
            
            [self showView:dateOfBirthContainerView mode:NO];
            [self showView:signupOptionContainerView mode:NO];
            [self showView:usernamePasswordContainerView mode:NO];
            [self showView:securityCodeContainerView mode:NO];
            [self showView:selectCountryContainerView mode:YES];
            
            break;
            
        default:
            break;
    }
}

-(void)showView:(UIView *)view mode:(BOOL)mode
{
    if (!view)
    {
        return;
    }
    
    [view setHidden:!mode];
}

-(void)setSecurityCodeMessage
{
    NSString *message = nil;
    
    switch (self.signUpOption)
    {
        case EMAIL:
            message = NSLocalizedString(@"EMAIL_SECURITY_CODE_TEXT", nil);
            break;
            
        case MOBILE:
            message = NSLocalizedString(@"MOBILE_SECURITY_CODE_TEXT", nil);
            break;
            
        default:
            break;
    }
    
    [securityCodeMessageLabel setText:message];
}

-(void)setSignInPlaceHolderText
{
    NSString *message = nil;
    
    switch (self.signUpOption)
    {
        case EMAIL:
            message = NSLocalizedString(@"EMAIL_TEXT", nil);
            break;
            
        case MOBILE:
            message = NSLocalizedString(@"MOBILE_NUMBER", nil);
            break;
            
        default:
            break;
    }
    
    [securityCodeTextField setPlaceholder:message];
}

#pragma mark - UITextField Delegate methods

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL mode = YES;
    
    if (textField.text.length == 0 || ([string isEqualToString:@""] && textField.text.length == 1))
    {
        mode = NO;
    }
    
    if ([self.delegate respondsToSelector:@selector(disableNextButton:)])
    {
        [self.delegate disableNextButton:mode];
    }
    
    return YES;
}

#pragma mark - UIButton event methods

- (IBAction)emailButtonTapped:(id)sender
{
    [self signUpOptionDidSelect:EMAIL];
}

- (IBAction)mobileButtonTapped:(id)sender
{
    [self signUpOptionDidSelect:MOBILE];
}

-(void)signUpOptionDidSelect:(SignUpOption)option
{
    if ([self.delegate respondsToSelector:@selector(signUpOptionSelected:)])
    {
        [self.delegate signUpOptionSelected:option];
    }
}
@end
