//
//  UIColorConstnts.h
//  PocketGuthubC
//
//  Created by Timofey on 10/8/22.
//

#ifndef UIColorConstnts_h
#define UIColorConstnts_h


#endif /* UIColorConstnts_h */

@implementation UIColor (Layout)

+ (UIColor *) cellUserNameTextColor {
    UIColor *color = [UIColor colorWithRed:166.0f/255.0f green:168.0f/255.0f        blue:179.0f/255.0f alpha:1.0f];
    return color;
};

+ (UIColor *) signInButtonColor {
    UIColor *color = [
      UIColor
        colorWithRed:35.0f/255.0f
        green:134.0f/255.0f
        blue:54.0f/255.0f alpha:1.0f
    ];
    return color;
};

+ (UIColor *) githubBg {
    UIColor *color = [UIColor colorWithRed:13.0f/255.0f green:17.0f/255.0f        blue:23.0f/255.0f alpha:1.0f];
    return color;
};

@end
