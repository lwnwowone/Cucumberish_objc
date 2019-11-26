#import "Game.h"

@implementation Game{
@private int number1;
@private int number2;
}

-(id)initWithNumber1:(int)num1 number2:(int)num2{
    self = [super init];
    self->number1 = num1;
    self->number2 = num2;
    return self;
}

-(NSString *)resolveInputNumber:(int)number{
    if(number > 0){
        bool flagFor1 = 0 == number % self->number1;
        bool flagFor2 = 0 == number % self->number2;
        
        if(flagFor1 && flagFor2) {
            return GAME_RESULT_BOTH;
        }
        else if(flagFor1) {
            return GAME_RESULT_NUMBER1;
        }
        else if(flagFor2) {
            return GAME_RESULT_NUMBER2;
        }
    }
    
    return GAME_RESULT_INVALID;
}

@end
