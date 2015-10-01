//
//  Time.h
//  iLiMiFree
//
//  Created by Flying meat on 9/5/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Time : NSManagedObject

@property (nonatomic, retain) NSString * applicationId;
@property (nonatomic, retain) NSString * categroyName;
@property (nonatomic, retain) NSString * downloads;
@property (nonatomic, retain) NSString * favorites;
@property (nonatomic, retain) NSString * imgName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * shares;
@property (nonatomic, retain) NSString * stars;
@property (nonatomic, retain) NSString * time;
@property (nonatomic, retain) NSString * collectimg;
@property (nonatomic, retain) NSString * collectName;

@end
