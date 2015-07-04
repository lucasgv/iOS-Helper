//
//  Prefs.m
//  Any
//
//  Created by Lucas Goes on 21/11/14.
//  Copyright (c) 2014 Lucas Goes. All rights reserved.
//

#import "Helper.h"
#import "Reachability.h"

@implementation Helper

#pragma mark - Defaults System

+ (void)setDefaultsObject:(id)object forKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:key];
    [defaults synchronize];
}

+ (id)getObjectForKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

+ (void)setNSDictionary:(NSDictionary *)value key:(NSString *)key
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    [prefs setObject:data forKey:key];
    [prefs synchronize];
}

+ (NSDictionary *)getNSDictionaryForKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [prefs objectForKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+ (void)setIntegerForKey:(NSInteger)value key:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:value forKey:key];
    [prefs synchronize];
}

+ (NSInteger)getInteger:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger value = [prefs integerForKey:key];
    
    return value;
}

+ (void)setBooleanForKey:(BOOL)value key:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setBool:value forKey:key];
    [prefs synchronize];
}

+ (BOOL)getBoolean:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    BOOL value = [prefs boolForKey:key];
    
    return value;
}

+ (void)deleteKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs removeObjectForKey:key];
    [prefs synchronize];
}

@end
