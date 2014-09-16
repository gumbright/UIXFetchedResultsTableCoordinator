//
//  UIXFetchedResultsTableCoordinator.m
//  tableactions
//
//  Created by Guy Umbright on 9/14/14.
//  Copyright (c) 2014 Umbright Consulting, Inc. All rights reserved.
//

#import "UIXFetchedResultsTableCoordinator.h"

@implementation UIXFetchedResultsTableCoordinator
/////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////
- (void) commonInit
{
    
}

/////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////
- (id) init
{
    if (self = [super init])
    {
        [self commonInit];
    }
    
    return self;
}

/////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////
- (void) awakeFromNib
{
    [self commonInit];
}

/////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////
- (UITableView*) tableViewFromDelegate
{
    return [self.fetchedResultsTableCoordinatorDelegate tableViewForUIXFetchedResultsTableCoordinator:self];
}

/////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////
- (void) controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [[self tableViewFromDelegate] beginUpdates];
}

/////////////////////////////////////////////////////
//
/////////////////////////////////////////////////////
- (void) controllerDidChangeContent:(NSFetchedResultsController*) controller
{
    [[self tableViewFromDelegate] endUpdates];
}

/////////////////////////////////////////////////////
//
////////////////////////////////////////////////////
- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    switch (type)
    {
        case NSFetchedResultsChangeDelete:
        {
            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:willDeleteAtIndexPath:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self willDeleteAtIndexPath:indexPath];
            }

            [[self tableViewFromDelegate] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            
            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:didDeleteAtIndexPath:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self didDeleteAtIndexPath:indexPath];
            }
        }
            break;
            
        case NSFetchedResultsChangeInsert:
        {
            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:willInsertAtIndexPath:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self willInsertAtIndexPath:indexPath];
            }
            
            [[self tableViewFromDelegate] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:didInsertAtIndexPath:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self didInsertAtIndexPath:indexPath];
            }
        }
            break;
            
        case NSFetchedResultsChangeMove:
        {
            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:willMoveFromIndexPath:to:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self willMoveFromIndexPath:indexPath to:newIndexPath];
            }

            [[self tableViewFromDelegate] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [[self tableViewFromDelegate] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:didMoveFromIndexPath:to:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self didMoveFromIndexPath:indexPath to:newIndexPath];
            }
        }
            break;
            
        case NSFetchedResultsChangeUpdate:
        {
            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:willUpdateAtIndexPath:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self willUpdateAtIndexPath:indexPath];
            }
            
            [[self tableViewFromDelegate] reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

            if ([self.fetchedResultsTableCoordinatorDelegate respondsToSelector:@selector(UIXFetchedResultsTableCoordinator:willUpdateAtIndexPath:)])
            {
                [self.fetchedResultsTableCoordinatorDelegate UIXFetchedResultsTableCoordinator:self willUpdateAtIndexPath:indexPath];
            }
            
        }
            break;
            
        default:
            break;
    }
}

@end
