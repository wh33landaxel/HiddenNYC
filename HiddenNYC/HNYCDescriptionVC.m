//
//  HNYCDescriptionVC.m
//  HiddenNYC
//
//  Created by Axel Nunez on 1/4/13.
//  Copyright (c) 2013 CISDD.axel. All rights reserved.
//

#import "HNYCDescriptionVC.h"
#import "LocationBrain.h"

@interface HNYCDescriptionVC ()

@property(weak,nonatomic) NSString *description;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property(strong,nonatomic) NSDictionary * places;

@end

@implementation HNYCDescriptionVC
@synthesize descriptionText = _descriptionText;
@synthesize places = _places;
@synthesize description = _description;


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
        return;
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

@end
