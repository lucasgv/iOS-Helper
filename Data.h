//
//  Data.h
//  Any
//
//  Created by Lucas Góes Valle on 17/06/15.
//  Copyright (c) 2015 ioasys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

//Create directory to save file
+ (void) createDirectory;

//Save new dictionary in file list
+ (void) saveFileInBaseWithDict:(NSDictionary *) dictToSave;

//Overwrite file list
+ (void) overwriteFileInBaseWithArray:(NSArray *) arrayToSave;

//Load file list
+ (NSArray *) loadFile;

//Delete directory and file
+ (void) deleteDirectory;

@end
