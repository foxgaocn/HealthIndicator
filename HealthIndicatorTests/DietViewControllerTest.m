#import "DietViewController.h"
#import "PDataAccessor.h"
#import "DummyFood.h"

    // Test support
#import <SenTestingKit/SenTestingKit.h>

// Uncomment the next two lines to use OCHamcrest for test assertions:
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

// Uncomment the next two lines to use OCMockito for mock objects:
#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>


@interface DietViewControllerTest : SenTestCase
@end

@implementation DietViewControllerTest
{
    DietViewController *sut;
    id<PDataAccessor> mockDA;
}

-(void)setUp{
    sut = [[DietViewController alloc]init];
    mockDA = mockProtocol(@protocol(PDataAccessor));
    
    sut.dataAccessor = mockDA;
    [sut view];
}

-(void)tearDown{
}




- (void)testPersonViewController_CaroliInput_textFieldShouldReturnYES
{
    BOOL shouldReturn = [sut textFieldShouldReturn:sut.caroliInput];
    assertThatBool(shouldReturn, is(@true));
}

- (void)testPersonViewController_FatInput_textFieldShouldReturnYES
{
    BOOL shouldReturn = [sut textFieldShouldReturn:sut.fatInput];
    assertThatBool(shouldReturn, is(@true));
}

- (void)testPersonViewController_CaroliInput_ShouldChangeCharacterReturnYES
{
    BOOL val= [sut textField:sut.caroliInput shouldChangeCharactersInRange:NSMakeRange (80, 100) replacementString:@"123"];
    assertThatBool(val, is(@YES));
}

- (void)testPersonViewController_FatInput_ShouldChangeCharacterReturnNO
{
    BOOL val= [sut textField:sut.fatInput shouldChangeCharactersInRange:NSMakeRange (80, 100) replacementString:@"abc"];
    assertThatBool(val, is(@NO));
}



@end
