//
//  NSString + Prefix.m
//  PocketGuthubC
//
//  Created by Timofey on 8/10/2022.
//

#import <Foundation/Foundation.h>
#import "NSString + Prefix.h"


@implementation NSString (Prefix)

+ (NSString *) append:(id) first, ...
{
    NSString * result = @"";
    id eachArg;
    va_list alist;
    if(first)
    {
        result = [result stringByAppendingString:first];
        va_start(alist, first);
        while (eachArg = va_arg(alist, id))
        result = [result stringByAppendingString:eachArg];
        va_end(alist);
    }
    return result;
}

- (NSString *)prefix:(NSInteger)length {
  NSMutableString *new = [[NSMutableString alloc] init];
  for(int i = 0; i < length; i++) {
    unichar part = [self characterAtIndex:i];
    NSString* s = [NSString stringWithCharacters:&part length:1];
    [new appendString:s];
  }
  return new;
}



@end
