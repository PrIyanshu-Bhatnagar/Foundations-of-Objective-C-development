//
//  ViewController.m
//  Peer_Review03
//
//  Created by Priyanshu Bhatnagar on 6/18/16.
//  Copyright © 2016 Priyanshu Bhatnagar. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *buttonConvert;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController


- (IBAction)buttonconvert_imp:(id)sender {
    self.buttonConvert.enabled = NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.buttonConvert.enabled = YES;
   
    double inputValue = [self.inputField.text floatValue];
    
    double inrValue = inputValue * currencies.INR;
    
    NSString *inr = [NSString stringWithFormat:@"%.2f",inrValue];
    
    self.currencyA.text = inr;
    
    double euroValue = inputValue * currencies.EUR;
    
    NSString *eur = [NSString stringWithFormat:@"%.2f",euroValue];
    
    self.currencyB.text = eur;
    
    double yenValue = inputValue * currencies.JPY;
    
    NSString *yen = [NSString stringWithFormat:@"%.2f",yenValue];
    
    self.currencyC.text = yen;
    
}
@end
