#import "PersonViewController.h"
#import "PDataAccessor.h"
#import "DummyPerson.h"
    // Collaborators

#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>


@interface PersonViewControllerTest : SenTestCase
@end

@implementation PersonViewControllerTest
{
    PersonViewController *sut;
    id<PDataAccessor> mockDA;
}

-(void)setUp{
    sut = [[PersonViewController alloc]init];
    mockDA = mockProtocol(@protocol(PDataAccessor));
    
    sut.dataAccessor = mockDA;
    [sut view];
}

-(void)tearDown{
}

- (void)testPersonViewControllerWhenNoDataSaved_ControlShouldInitialized;
{
    [given([mockDA getPerson]) willReturn:nil];
    [sut viewDidLoad];
    assertThatBool(sut.nameInput.enabled, is(@YES));
    assertThat(sut.nameInput.text, is(@""));
    assertThat(sut.weightInput.text, is(@""));
    assertThat(sut.heightInput.text, is(@""));
}

- (void)testPersonViewControllerWhenDataSaved_ControlShouldInitialized
{
    DummyPerson *p = [[DummyPerson alloc] init];
    p.name = @"abcd";
    p.weight = @160;
    p.height = @190;

    [given([mockDA getPerson]) willReturn:p];
    
    
    [sut viewDidLoad];
    assertThatBool(sut.nameInput.enabled, is(@NO));
    assertThat(sut.nameInput.text, is(@"abcd"));
    assertThat(sut.weightInput.text, is(@"160"));
    assertThat(sut.heightInput.text, is(@"190"));
}

- (void)testPersonViewController_NameInput_textFieldShouldReturnYES
{
    BOOL shouldReturn = [sut textFieldShouldReturn:sut.nameInput];
    assertThatBool(shouldReturn, is(@true));
}

- (void)testPersonViewController_WeightInput_textFieldShouldReturnYES
{
    BOOL shouldReturn = [sut textFieldShouldReturn:sut.weightInput];
    assertThatBool(shouldReturn, is(@true));
}

- (void)testPersonViewController_HeightInput_textFieldShouldReturnYES
{
    BOOL shouldReturn = [sut textFieldShouldReturn:sut.heightInput];
    assertThatBool(shouldReturn, is(@true));
}

- (void)testPersonViewController_HeightInput_ShouldChangeCharacterReturnYES
{
    BOOL val= [sut textField:sut.weightInput shouldChangeCharactersInRange:NSMakeRange (80, 100) replacementString:@"123"];
    assertThatBool(val, is(@YES));
}

- (void)testPersonViewController_HeightInput_ShouldChangeCharacterReturnNO
{
    BOOL val= [sut textField:sut.weightInput shouldChangeCharactersInRange:NSMakeRange (80, 100) replacementString:@"abc"];
    assertThatBool(val, is(@NO));
}

- (void)testPersonViewController_NameInput_ShouldChangeCharacterReturnYes
{
    BOOL val= [sut textField:sut.nameInput shouldChangeCharactersInRange:NSMakeRange (80, 100) replacementString:@"abc"];
    assertThatBool(val, is(@YES));
}

- (void)testPersonViewController_WeightInputWithEmptyString_ShouldChangeCharacterReturnYes
{
    BOOL val= [sut textField:sut.weightInput shouldChangeCharactersInRange:NSMakeRange (80, 100) replacementString:@""];
    assertThatBool(val, is(@YES));
}



@end
