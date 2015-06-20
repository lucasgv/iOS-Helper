//
//  Helper.h
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

#pragma mark - Imagens

//Change image color
+ (UIImage *)colorImage:(UIImage *)image withColor:(UIColor *)color;

//Image Preload in cache
+ (UIImage *) preloadedImage:(NSString *) img;

//Crop image
+ (UIImage *)cropImage:(UIImage *)image toSize:(CGSize)newSize;

#pragma mark - Validations

//Email validation
+ (BOOL) validateEmail: (NSString *) candidate;

//CPF validation
+ (BOOL)validateCPFWithNSString:(NSString *)cpf;

#pragma mark - Date Utils

//Date with string by format
+ (NSDate *)convertDateWithString:(NSString *) dateString andFormat:(NSString *) format;

//Day of week
+ (NSString *)dayOfWeekWithDate:(NSDate *) date;

//Get hour, minute and seconds with date
+ (NSDictionary *) hourMinuteAndSecondsWithDate:(NSDate *) date;

#pragma mark - Internet Connection

//Checks internet connection
+ (BOOL)connected;

#pragma mark - Alerts

//Show Alert with parameters
+(void)showAlertWithTitle :(NSString *) title andMessage:(NSString *) message andCancelButtonTitle:(NSString *) cancelBtnTitle otherButtonTitles:(NSArray *)otherButtonTitles andDelegate:(UIViewController *) delegate;


@end
