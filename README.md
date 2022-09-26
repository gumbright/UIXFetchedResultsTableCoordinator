# UIXFetchedResultsTableCoordinator

[![CI Status](http://img.shields.io/travis/Guy Umbright/UIXFetchedResultsTableCoordinator.svg?style=flat)](https://travis-ci.org/Guy Umbright/UIXFetchedResultsTableCoordinator)
[![Version](https://img.shields.io/cocoapods/v/UIXFetchedResultsTableCoordinator.svg?style=flat)](http://cocoadocs.org/docsets/UIXFetchedResultsTableCoordinator)
[![License](https://img.shields.io/cocoapods/l/UIXFetchedResultsTableCoordinator.svg?style=flat)](http://cocoadocs.org/docsets/UIXFetchedResultsTableCoordinator)
[![Platform](https://img.shields.io/cocoapods/p/UIXFetchedResultsTableCoordinator.svg?style=flat)](http://cocoadocs.org/docsets/UIXFetchedResultsTableCoordinator)

# No longer maintained

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Integrating UIXFetchedResultsTableCoordinator is easy:

1. Allocate a UIXFetchedResultsTableCoordinator instance
2. Set it to be your NSFetchedResultsController delegate
3. Set the delegate for the UIXFetchedResultsTableCoordinator

```
self.frtCoordinator = [[UIXFetchedResultsTableCoordinator alloc] init];  /* 1 */
_fetchedResults.delegate = self.frtCoordinator;   /* 2 */
self.frtCoordinator.fetchedResultsTableCoordinatorDelegate = self.viewController;  /* 3 */
```
The delegate for has a single required method:

```
- (UITableView*) tableViewForUIXFetchedResultsTableCoordinator:(UIXFetchedResultsTableCoordinator*) coordinator;
```
which should return the UITableView instance that is using the NSFetchedResultsController as a datasource.

The delegate also has optional methods for pre/post of each of the four basic operations: delete, insert, move, and update.

## Requirements

Built with iOS 8 in mind but it will likely work just fine with 6.x (or perhaps even lower).

## Installation

UIXFetchedResultsTableCoordinator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "UIXFetchedResultsTableCoordinator"

## Author

Guy Umbright, gumbright@gmail.com

## License

UIXFetchedResultsTableCoordinator is available under the MIT license. See the LICENSE file for more info.

