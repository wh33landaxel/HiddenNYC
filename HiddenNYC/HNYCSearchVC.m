//
//  HNYCSearchVC.m
//  HiddenNYC
//
//  Created by Axel Nunez on 1/13/13.
//  Copyright (c) 2013 CISDD.axel. All rights reserved.
//

#import "HNYCSearchVC.h"
#import "HNYCDescriptionVC.h"

@interface HNYCSearchVC ()

@end

@implementation HNYCSearchVC
@synthesize placeDict = _placeDict;
@synthesize placeArray = _placeArray;


-(void)setPlaceDict:(NSDictionary *)placeDict{
    if(!_placeDict){
        _placeDict = [[NSDictionary alloc] initWithDictionary:placeDict];
    } else
        _placeDict = placeDict;
}

-(void)setPlaceArray:(NSArray *)placeArray{
    if(!_placeArray)
        _placeArray = [[NSArray  alloc]initWithArray:placeArray];
    else
        _placeArray = placeArray;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.placeDict.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Search Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Values in array of places, woe_name is the city, _content is province and country
    NSDictionary *dict;
    
    // Full Location is the city, province, and country.
    // Subtitle is just province, and country.
    NSString *fullLocation, *subtitle;
    
    // Splits Full location by commas to obtain the subtitle
    NSArray *placeDetail = [[NSArray alloc] initWithArray:[_placeDict allValues]];
    
    // Retrieves the top places from flickr
    // [self setTheTopPlaces:[FlickrFetcher topPlaces]];

    // Alphabetizes the array by city name
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    placeDetail = [placeDetail sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    [self setPlaceArray:placeDetail];
  //  NSLog(@"%@",placeDetail);
    //Prints the title and subtitle of corresponding table row
    dict = [placeDetail objectAtIndex:indexPath.row];
    NSDictionary * dictCopy = [dict mutableCopy];
    cell.textLabel.text = [dict objectForKey:@"name"];
    fullLocation = [dict objectForKey:@"_content"];
    placeDetail = [fullLocation componentsSeparatedByString:@","];
    
    // Checks whether subtitle has province
    subtitle = [placeDetail objectAtIndex:1];
    if(placeDetail.count == 3){
        subtitle =   [subtitle stringByAppendingString:@","];
        subtitle =   [subtitle stringByAppendingString:[placeDetail objectAtIndex:2]];
    }
    cell.detailTextLabel.text = subtitle;
    
    
  //  [self setLocation:dictCopy];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Search Description"]){
        UITableViewCell * cell;
        if ([sender isKindOfClass:[UITableViewCell class]]){
            cell = sender;
        }
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSArray * locationArray = [_placeArray objectAtIndex:indexPath.row];
        NSDictionary * dict;
        dict = [[NSDictionary alloc] initWithDictionary: [_placeArray objectAtIndex:indexPath.row]];
        NSString * name = [dict objectForKey:@"name"];
        NSLog(@"%@",name);
        NSString * description = [dict objectForKey: @"description"];
        NSLog(@"%@",description);
       [segue.destinationViewController setTitle:name];
        [segue.destinationViewController setDescription:description];
        

        
    }

}

@end
