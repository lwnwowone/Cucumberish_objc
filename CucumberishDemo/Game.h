#import <Foundation/Foundation.h>

#define GAME_RESULT_BOTH @"Both"
#define GAME_RESULT_NUMBER1 @"Number1"
#define GAME_RESULT_NUMBER2 @"Number2"
#define GAME_RESULT_INVALID @"Invalid input"

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

-(id)initWithNumber1:(int)num1 number2:(int)num2;
-(NSString *)resolveInputNumber:(int)number;

@end

NS_ASSUME_NONNULL_END
