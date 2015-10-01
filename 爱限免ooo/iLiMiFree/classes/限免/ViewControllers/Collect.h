//
//  Collect.h
//  iLiMiFree
//
//  Created by Flying meat on 9/5/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Collect : NSManagedObject

@property (nonatomic, retain) NSData * img;
@property (nonatomic, retain) NSString * name;

@end
