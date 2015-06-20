//
//  Data.m
//  Any
//
//  Created by Lucas Góes Valle on 17/06/15.
//  Copyright (c) 2015 ioasys. All rights reserved.
//

#import "Data.h"

@implementation Data

+ (void) saveFileInBaseWithDict:(NSDictionary *) dictToSave
{
    NSMutableArray *arrayFile = [[NSMutableArray alloc]initWithArray:[self loadFile]];
    [arrayFile addObject:dictToSave];
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Base"];
    path = [path stringByAppendingPathComponent:@"File"];
    
    [arrayFile writeToFile:path atomically:YES];
}

+ (void) overwriteFileInBaseWithArray:(NSArray *) arrayToSave
{
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Base"];
    path = [path stringByAppendingPathComponent:@"File"];
    
    [arrayToSave writeToFile:path atomically:YES];
}

+ (void) createDirectory
{
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Base"];
    NSError *error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        if (![[NSFileManager defaultManager] createDirectoryAtPath:path
                                       withIntermediateDirectories:NO
                                                        attributes:nil
                                                             error:&error])
        {
            NSLog(@"Create directory error: %@", error);
        }
    }
    
}

+ (NSArray *) loadFile
{
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Base"];
    path = [path stringByAppendingPathComponent:@"File"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSArray *arrayBaseFile = [NSArray arrayWithContentsOfFile:path];
        return arrayBaseFile;
    }
    else
    {
        NSLog(@"File does not exist");
        return nil;
    }
}

+ (void) deleteDirectory
{
    NSString *path;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Base"];
    NSError *error;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])	//Does directory exist?
    {
        if (![[NSFileManager defaultManager] removeItemAtPath:path error:&error])	//Delete it
        {
            NSLog(@"Delete directory error: %@", error);
        }
    }
}

@end
