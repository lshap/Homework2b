//
//  LMSTableViewController.m
//  Homework2b
//
//  Created by Lauren Shapiro on 3/10/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSTableViewController.h"
#import "LMSViewController.h"
#import "LMSAddNoteViewController.h"
#define kLMSCellIdentifier @"note cell id"

@interface LMSTableViewController ()
@property (strong, nonatomic) NSMutableArray *noteTitles;
@property (strong, nonatomic) NSMutableArray *noteDescriptions;
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

//    _noteTitles = @[@"note title 1",
//                    @"note title 2",
//                    @"note title 3",
//                    @"note title 4"];
//    
//    _noteDescriptions = @[@"describe note 1 here",
//                    @"describe note 2 here",
//                    @"describe note 3 here",
//                    @"describe note 4 here"];
    
    
    _noteTitles = [[NSMutableArray alloc]init];
    _noteDescriptions = [[NSMutableArray alloc]init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    [detailViewController setTitleBar: currtitle];
    [detailViewController setLabel: currdescription];
    }
    else
    {
        
    }
}

-(IBAction)unwindFromNewNoteView:(UIStoryboardSegue *)segue {
    LMSAddNoteViewController* vc = [segue sourceViewController];

    NSString* newviewtitle = vc.addTitleLabel.text;
    NSString* newviewdescription = vc.addDescriptionLabel.text;
    [_noteTitles addObject:newviewtitle];
    [_noteDescriptions addObject:newviewdescription];
    [self.tableView reloadData];
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
