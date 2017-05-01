//
//  ViewController.m
//  UnitConvertor
//
//  Created by Priyanshu Bhatnagar on 6/17/16.
//  Copyright © 2016 Priyanshu Bhatnagar. All rights reserved.
//

#import "ViewController.h"


double convertkmToMile(double userInput){
    userInput *= 0.62;
    return userInput;
}

double convertKmToMeters(double userInput){
    userInput *= 1000;
    return userInput;
}

double convertKmToCentimeters(double userInput){
    userInput *= 1000 * 100;
    return userInput;
}

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)convertButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    
    double userInput = [self.inputField.text doubleValue];
    
    if(self.segmentController.selectedSegmentIndex == 0){
        double unitMile = convertkmToMile(userInput);
        
        [buf appendString: [@(unitMile)stringValue]];
    }
    else if(self.segmentController.selectedSegmentIndex == 1){
        double unitMeters = convertKmToMeters(userInput);
        [buf appendString: [@(unitMeters)stringValue]];
    }
    else if(self.segmentController.selectedSegmentIndex == 2){
    
        double unitCentimeters = convertKmToCentimeters(userInput);
    
        [buf appendString: [@(unitCentimeters)stringValue]];
    }
    
    self.outputLabel.text = buf;
}

@end
