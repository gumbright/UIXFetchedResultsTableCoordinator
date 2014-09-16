//
//  UIXFetchedResultsTableCoordinator.h
//  tableactions
//
//  Created by Guy Umbright on 9/14/14.
//  Copyright (c) 2014 Umbright Consulting, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class UIXFetchedResultsTableCoordinator;

@protocol UIXFetchedResultsTableCoordinatorDelegate
@required
- (UITableView*) tableViewForUIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator;

@optional
- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator willDeleteAtIndexPath:(NSIndexPath*) indexPath;
- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator didDeleteAtIndexPath:(NSIndexPath*) indexPath;

- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator willInsertAtIndexPath:(NSIndexPath*) indexPath;
- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator didInsertAtIndexPath:(NSIndexPath*) indexPath;

- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator willUpdateAtIndexPath:(NSIndexPath*) indexPath;
- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator didUpdateAtIndexPath:(NSIndexPath*) indexPath;

- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator willMoveFromIndexPath:(NSIndexPath*) indexPath to:(NSIndexPath*) newIndexPath;
- (void) UIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator didMoveFromIndexPath:(NSIndexPath*) indexPath to:(NSIndexPath*) newIndexPath;

@end

@interface UIXFetchedResultsTableCoordinator : NSObject <NSFetchedResultsControllerDelegate>
@property (nonatomic, weak) NSObject<UIXFetchedResultsTableCoordinatorDelegate>* fetchedResultsTableCoordinatorDelegate;
@end
