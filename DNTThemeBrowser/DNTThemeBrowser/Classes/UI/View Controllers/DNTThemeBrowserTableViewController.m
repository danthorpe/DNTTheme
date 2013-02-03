//
//  DNTThemeBrowserTableViewController.m
//  DNTThemeBrowser
//
//  Created by Daniel Thorpe on 26/01/2013.
//  Copyright (c) 2013 Daniel Thorpe. All rights reserved.
//

#import "DNTThemeBrowserTableViewController.h"
#import "DNTThemeBrowserTheme.h"
#import "DNTTheme.h"

NSString * const DNTTableViewComponent = @"DNTTableViewComponent";

@interface DNTThemeBrowserTableViewController (/* Private */)
@property (nonatomic) NSArray *words;
@end

@implementation DNTThemeBrowserTableViewController

- (id)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.words = @[ @"Car", @"Bicyle", @"Computer", @"Steve Jobs", @"Great Britain", @"Music", @"Pizza", @"Coca Cola", @"Gloves", @"Climate change", @"Apple Inc.", @"Radiohead", @"iPhone", @"Carpet" ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Theme Browser", @"Navigation title for the Theme Browser");
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    self.toolbarItems = @[ refresh ];
    self.navigationController.toolbarHidden = NO;
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark - Actions

- (IBAction)refresh:(id)sender {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 + (NSInteger)arc4random_uniform(4);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1 + (NSInteger)arc4random_uniform(5);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        [[DNTThemeBrowserTheme textLabelTheme] applyToLabel:cell.textLabel];
        [[DNTThemeBrowserTheme detailedTextLabelTheme] applyToLabel:cell.detailTextLabel];
    }
    
    // Configure the cell
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    // Set some meaningless text
    cell.textLabel.text = self.words[ arc4random_uniform(self.words.count) ];
    cell.detailTextLabel.text = self.words[ arc4random_uniform(self.words.count) ];
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
