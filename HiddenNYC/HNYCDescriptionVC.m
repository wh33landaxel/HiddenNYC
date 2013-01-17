//
//  HNYCDescriptionVC.m
//  HiddenNYC
//
//  Created by Axel Nunez on 1/4/13.
//  Copyright (c) 2013 CISDD.axel. All rights reserved.
//

#import "HNYCDescriptionVC.h"
#import "LocationBrain.h"
#import "HNYCPhotoViewController.h"

@interface HNYCDescriptionVC ()

@property(weak,nonatomic) NSString *description;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property(strong,nonatomic) NSDictionary * places;
@property (strong, nonatomic) NSString *address;

@end

@implementation HNYCDescriptionVC
@synthesize descriptionText = _descriptionText;
@synthesize places = _places;
@synthesize description = _description;
@synthesize address = _address;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)setPlaces:(NSDictionary *)dictionary{
    if(!_places){
        _places = [[NSDictionary alloc] initWithDictionary:dictionary];
        //NSLog(@"%@", _places);
    }
    else
        _places = dictionary;
}

-(void)setAddress:(NSString *)address{
    if(!_address)
        _address = [[NSString alloc]initWithString:address];
    else
        _address = address;
}


-(void)setDescription:(NSString *)description{
    _description = description;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    _descriptionText.text = _description;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Show Photos"]){
        NSLog(@"%@", self.address);
        NSLog(@"%@", _places);
        [segue.destinationViewController setPlaceName:self.title];
        [segue.destinationViewController setMainDict:self.places];
        [segue.destinationViewController setAddress: self.address];
        
        // Send name of place
        // Send Array of place
    }
    
}

@end
