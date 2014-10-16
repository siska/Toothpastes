//
//  ViewController.m
//  ToothpastesIHaveLovedAndAdored
//
//  Created by S on 10/16/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "AdoredToothpastesViewController.h"
#import "ToothpastesTableViewController.h"

@interface AdoredToothpastesViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *adoredToothpastes; //step 3
@property (strong, nonatomic) IBOutlet UITableView *adoredTableView;

@end

@implementation AdoredToothpastesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self load]; //4
    if (self.adoredToothpastes == nil) //4
    {
        self.adoredToothpastes = [NSMutableArray array]; //step 3, but moved here in step 4
    }
}

-(IBAction)unwindFromToothpastesViewController:(UIStoryboardSegue *)segue //step 3
{
    ToothpastesTableViewController *viewController = segue.sourceViewController;
    [self.adoredToothpastes addObject:[viewController adoredToothpaste]];
    [self.adoredTableView reloadData];
    [self save]; //step 4
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adoredToothpastes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    cell.textLabel.text = [self.adoredToothpastes objectAtIndex:indexPath.row];
    return cell;
}

- (NSURL *)documentsDirectory //step 4 - we created it
{
    NSFileManager *fileManager = [NSFileManager defaultManager]; //singleton
    NSArray *files = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    return files.firstObject; //step 4 - we take in the first object because we ask for plural above - URLs - really only get one; add firstob to make sure
}

- (void)load
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults]; //step 5
    NSURL *pList = [[self documentsDirectory] URLByAppendingPathComponent:@"pastes.plist"]; //we're setting this name to be saved in the files

    self.adoredToothpastes = [NSMutableArray arrayWithContentsOfURL:pList]; //step 4 - just withcontentsofURL - apple is switching to urls, not paths
    NSLog(@"date: %@", [userDefaults objectForKey:@"LastSaved"]); //step 5 - used to make sure the date thing works - will be null the first time the app is loaded and then will give the date after that

}

- (void)save
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults]; //singleton
    NSURL *pList = [[self documentsDirectory] URLByAppendingPathComponent:@"pastes.plist"];
    [self.adoredToothpastes writeToURL:pList atomically:YES];

    [userDefaults setObject:[NSDate date] forKey:@"LastSaved"];
    [userDefaults synchronize];
}





@end
