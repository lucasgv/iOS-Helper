//
//  Prefs.h
//  Any
//
//  Created by Lucas Goes on 21/11/14.
//  Copyright (c) 2014 Lucas Goes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject

#pragma mark - Defaults System

//Set obj in NSUserDefaults
+ (void)setDefaultsObject:(id)object forKey:(NSString *)key;

//Get obj in NSUserDefaults
+ (id)getObjectForKey:(NSString *)key;

//Set NSDicionary in NSUserDefaults
+ (void)setNSDictionary:(NSDictionary *)value key:(NSString *)key;

//Get NSDicionary in NSUserDefaults
+ (NSDictionary *)getNSDictionaryForKey:(NSString *)key;

//Set NSInteger in NSUserDefaults
+ (void)setIntegerForKey:(NSInteger)value key:(NSString *)key;

//Get NSInteger in NSUserDefaults
+ (NSInteger)getInteger:(NSString *)key;

//Set BOOL in NSUserDefaults
+ (void)setBooleanForKey:(BOOL)value key:(NSString *)key;

//Get BOOL in NSUserDefaults
+ (BOOL)getBoolean:(NSString *)key;

//Delete NSUserDefaults
+ (void)deleteKey:(NSString *)key;

@end
