//
//  SportsCalViewController.m
//  RebelNet
//

#import "SportsCalViewController.h"

@interface SportsCalViewController()

@end



@implementation SportsCalViewController

- (CGSize) collectionView: (UICollectionView *) collectionView
				   layout: (UICollectionViewLayout *) collectionViewLayout
   sizeForItemAtIndexPath: (NSIndexPath *) indexPath {
	
	CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = screenRect.size.width;
	
	if (screenWidth == 320)
		return CGSizeMake(90.f, 75.f);
	else if (screenWidth == 375)
		return CGSizeMake(110.f, 75.f);
	else if (screenWidth == 414)
		return CGSizeMake(120.f, 75.f);
	else if (screenWidth == 768)
		return CGSizeMake(240.f, 75.f);
	
	return CGSizeMake(155.f, 75.f);
}


#pragma mark - Collection view data source


- (NSInteger) numberOfSectionsInCollectionView: (UICollectionView *) collectionView {
    return 0;
}


- (NSInteger) collectionView: (UICollectionView *) collectionView numberOfItemsInSection: (NSInteger) section {
    return 0;
}

- (UICollectionViewCell *) collectionView: (UICollectionView *) collectionView
				   cellForItemAtIndexPath: (NSIndexPath *) indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @""
																		   forIndexPath: indexPath
								  ];
	
    
    return cell;
}


#pragma mark - Delegate methods


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

 
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

 
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
