//
//  Quote.m
//  ControllingSource
//
//  Created by Felipe on 8/12/13.
//  Copyright (c) 2013 Felipe Laso Marsetti. All rights reserved.
//

#import "Quote.h"

@implementation Quote

@dynamic famousQuote;
@dynamic personName;

- (void)awakeFromInsert //invoked automatically by the Core Data framework when the receiver is first inserted into a managed object context.
{
    [super awakeFromInsert];
    
    NSString *quotesFilePath = [[NSBundle mainBundle]
                                pathForResource:@"QuotesList"
                                ofType:@"plist"];
    
    
    NSArray *quotesArray = [NSArray arrayWithContentsOfFile:quotesFilePath];
    NSLog (@"quotesArray: %@", quotesArray);
    
    NSUInteger quoteIndex = arc4random() % [quotesArray count]; //random number
    NSDictionary *quoteDictionary = quotesArray[quoteIndex];
    NSLog (@"quoteDictionary: %@", quoteDictionary);
    
    
    [self setPrimitiveValue:quoteDictionary[@"personName"]
                     forKey:@"personName"];
    [self setPrimitiveValue:quoteDictionary[@"famousQuote"]
                     forKey:@"famousQuote"];
}

@end
