//
//  LMSTableViewController.m
//  Homework2b
//
//  Created by Lauren Shapiro on 3/10/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSTableViewController.h"
#import "LMSViewController.h"
#import "LMSMapViewController.h"
#import "LMSAddNoteViewController.h"

#define kLMSCellIdentifier @"note cell id"

@interface LMSTableViewController ()
@property (strong, nonatomic) NSMutableArray *noteTitles;
@property (strong, nonatomic) NSMutableArray *noteDescriptions;
@property (strong, nonatomic) NSMutableArray *noteLocations;
@property (strong, nonatomic) CLLocation* lastLocation;
@end

@implementation LMSTableViewController

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
    // initialize note storage structures
    _noteTitles = [[NSMutableArray alloc]init];
    _noteDescriptions = [[NSMutableArray alloc]init];
    _noteLocations = [[NSMutableArray alloc]init];
    
   // initialize location manager
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    _locationManager.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   

    if ([segue.identifier isEqualToString:@"DisplayDetailView"]){
    LMSViewController* detailViewController = [segue destinationViewController];
    
    NSIndexPath *currpath = [[NSIndexPath alloc]init];
    currpath = self.tableView.indexPathForSelectedRow;
        
     NSString *currtitle = _noteTitles[currpath.row];
     NSString *currdescription = _noteDescriptions[currpath.row];
     CLLocation* location = _noteLocations[currpath.row];
    
    [detailViewController setTitleText: currtitle];
    [detailViewController setLabel: currdescription];
    [detailViewController setViewLocation: location];
    }
 
    else
    {
        [self.locationManager startUpdatingLocation];
        }
}

-(void)locationManager:(CLLocationManager*) manager didUpdateLocations:(NSArray*) locations
 {
     self.lastLocation = [locations lastObject];
 }

-(IBAction)unwindFromNewNoteViewWithAdd:(UIStoryboardSegue *)segue {
    LMSAddNoteViewController* vc = [segue sourceViewController];

    NSString* newviewtitle = vc.addTitleLabel.text;
    NSString* newviewdescription = vc.addDescriptionLabel.text;
    
    [_noteTitles addObject:newviewtitle];
    [_noteDescriptions addObject:newviewdescription];
    [_noteLocations addObject: self.lastLocation];
    [self.locationManager stopUpdatingLocation];
    [self.tableView reloadData];
}

-(IBAction)unwindFromNewNoteViewWithCancel:(UIStoryboardSegue *)segue
{
  [self.locationManager stopUpdatingLocation];
}

-(IBAction)unwindFromDetailView:(UIStoryboardSegue *)segue {

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _noteTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kLMSCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLMSCellIdentifier];
    }
    
    cell.textLabel.text = self.noteTitles[indexPath.row];
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

  [self performSegueWithIdentifier:@"DisplayDetailView" sender:self];
    
    
}

@end
