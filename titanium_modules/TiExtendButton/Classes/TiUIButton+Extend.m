#import "TiUIButton+Extend.h"
#import "TiUtils.h"

@implementation TiUIButton (TiUIButton_Extend)

- (void)setShowsTouchWhenHighlighted_:(id)args
{
    BOOL value = [TiUtils boolValue:args def:NO];
    //NSLog(@"showsTouchWhenHighlighted is %@", value ? @"YES" : @"NO" );
    [[self button] setShowsTouchWhenHighlighted:value];
}

@end
