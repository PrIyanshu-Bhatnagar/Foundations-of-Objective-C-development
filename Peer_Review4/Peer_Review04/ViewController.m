//
//  ViewController.m
//  Peer_Review04
//
//  Created by OSX on 23/06/16.
//  Copyright © 2016 OSX. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *startloc;
@property (weak, nonatomic) IBOutlet UITextField *endlocA;
@property (weak, nonatomic) IBOutlet UITextField *endlocB;
@property (weak, nonatomic) IBOutlet UITextField *endlocC;
@property (weak, nonatomic) IBOutlet UITextField *endlocD;
@property (weak, nonatomic) IBOutlet UILabel *disA;
@property (weak, nonatomic) IBOutlet UILabel *disB;
@property (weak, nonatomic) IBOutlet UILabel *disC;
@property (weak, nonatomic) IBOutlet UILabel *disD;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentcon;

@end

@implementation ViewController

- (IBAction)CalButton_imp:(id)sender {
    
    self.calculateButton.enabled = NO;
    
    self.req = [DGDistanceRequest alloc];
    NSLog(@"Object created");
    NSString *start = self.startloc.text;
    NSString *destA = self.endlocA.text;
    NSString *destB = self.endlocB.text;
    NSString *destC = self.endlocC.text;
    NSString *destD = self.endlocD.text;
    NSArray *dests = @[destA,destB,destC,destD];
    
    self.req =[self.req initWithLocationDescriptions:dests sourceDescription:start];
    __weak ViewController *weakself = self;
    
    self.req.callback = ^(NSArray *responses){
        ViewController *strongself = weakself;
        if(!strongself) return;
        
        NSNull *badreq =[NSNull null];
        
        if(responses[0] != badreq){
            
            if(strongself.segmentcon.selectedSegmentIndex == 0){
                double num = [responses[0] floatValue];
                NSString *x = [NSString stringWithFormat:@"%.2f m",num];
                strongself.disA.text = x;
            }
            else if(strongself.segmentcon.selectedSegmentIndex == 1){
            double num = ([responses[0] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km",num];
            strongself.disA.text = x;
        }
            else if(strongself.segmentcon.selectedSegmentIndex == 2){
                
                double num = ([responses[0] floatValue]/1000.0 * 0.62);
                NSString *x = [NSString stringWithFormat:@"%.2f miles",num];
                strongself.disA.text = x;            }
        }
         else strongself.disA.text = @"Bad Request";
        
        if(responses[1] != badreq){
            if(strongself.segmentcon.selectedSegmentIndex == 0){
                double num = ([responses[1] floatValue]);
                NSString *x = [NSString stringWithFormat:@"%.2f m",num];
                strongself.disB.text = x;            }
            else if(strongself.segmentcon.selectedSegmentIndex == 1){
            double num = ([responses[1] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km",num];
            strongself.disB.text = x;
        }
            else if(strongself.segmentcon.selectedSegmentIndex == 2){
                double num = ([responses[1] floatValue]/1000.0 *0.62);
                NSString *x = [NSString stringWithFormat:@"%.2f miles",num];
                strongself.disB.text = x;            }
        }
        else strongself.disB.text = @"Bad Request";
       
        if(responses[2] != badreq){
            if(strongself.segmentcon.selectedSegmentIndex == 0){
                double num = ([responses[2] floatValue]);
                NSString *x = [NSString stringWithFormat:@"%.2f m",num];
                strongself.disC.text = x;
            }
            else if(strongself.segmentcon.selectedSegmentIndex == 1){
            double num = ([responses[2] floatValue]/1000.0);
            NSString *x = [NSString stringWithFormat:@"%.2f km",num];
            strongself.disC.text = x;
        }
            else if(strongself.segmentcon.selectedSegmentIndex == 2){
                double num = ([responses[2] floatValue]/1000.0 * 0.62);
                NSString *x = [NSString stringWithFormat:@"%.2f miles",num];
                strongself.disC.text = x;
            }
        }
        else strongself.disC.text = @"Bad Request";
        
        if(responses[3] != badreq){
            
            if(strongself.segmentcon.selectedSegmentIndex == 0){
                double num = [responses[3] floatValue];
                NSString *x = [NSString stringWithFormat:@"%.2f m",num];
                strongself.disD.text = x;
            }
            else if(strongself.segmentcon.selectedSegmentIndex == 1){
                double num = ([responses[3] floatValue]/1000.0);
                NSString *x = [NSString stringWithFormat:@"%.2f km",num];
                strongself.disD.text = x;
            }
            else if(strongself.segmentcon.selectedSegmentIndex == 2){
                
                double num = ([responses[3] floatValue]/1000.0 * 0.62);
                NSString *x = [NSString stringWithFormat:@"%.2f miles",num];
                strongself.disD.text = x;            }
        }
        else strongself.disA.text = @"Bad Request";
        strongself.req =nil;
        strongself.calculateButton.enabled = YES;
    };
    [self.req start];
    
    
    }


@end
