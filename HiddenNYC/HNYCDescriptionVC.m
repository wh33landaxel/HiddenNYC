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
@property (strong, nonatomic) NSArray *favoritesArray;

@end

@implementation HNYCDescriptionVC
@synthesize descriptionText = _descriptionText;
@synthesize places = _places;
@synthesize description = _description;
@synthesize address = _address;
@synthesize favoritesArray = _favoritesArray;


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

-(void)setFavoritesArray:(NSArray *)favoritesArray{
    if(!_favoritesArray)
        _favoritesArray = [[NSArray alloc]initWithArray:favoritesArray];
    else
        _favoritesArray = favoritesArray;
}


-(void)setDescription:(NSString *)description{
    _description = description;
}




- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSArray *temp = [[NSArray alloc]init];
    [self setFavoritesArray:temp];
    _descriptionText.text = _description;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)favoritePressed:(id)sender {
   // [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"favoritesArray"];
  //  NSUserDefaults *pref =[[NSUserDefaults alloc]init];
    if(![[NSUserDefaults standardUserDefaults]objectForKey:@"favoritesArray"]){
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"favoritesArray"];
        NSMutableArray *favArray = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"favoritesArray"]];
       // NSMutableDictionary *mutDict = [[NSMutableDictionary alloc]initWithDictionary:
        [favArray addObject:[_places objectForKey:_address]];
        [[NSUserDefaults standardUserDefaults] setObject:favArray forKey:@"favoritesArray"];
    }
    else{
        NSMutableArray *favArray = [[NSMutableArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"favoritesArray"]];
        [favArray addObject:[_places objectForKey:_address]];
        [[NSUserDefaults standardUserDefaults] setObject:favArray forKey:@"favoritesArray"];
    }
     
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
