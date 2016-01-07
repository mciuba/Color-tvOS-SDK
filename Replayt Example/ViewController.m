//
//  ViewController.m
//  Replayt Example
//
//  Created by Jordan Jasinski on 14/12/15.
//  Copyright © 2015 Jordan Jasinski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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


-(IBAction)showRandomAd:(id)sender {
    [[RPLTAdController sharedAdController] adViewControllerWithCompletion:^(RPLTAdViewController * _Nullable vc, NSError * _Nullable error) {
        
        NSLog(@"ViewController: %@", vc);
        NSLog(@"Error: %@", error);
        
        vc.adCompleted = ^{
            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.navigationController popViewControllerAnimated:YES];
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            });
        };
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:vc animated:YES completion:^{
                
            }];
            //[self.navigationController pushViewController:vc animated:YES];
        });
    }];
}

@end