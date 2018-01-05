import XCTest
@testable import UAPusherTests

XCTMain([
    testCase(PushUrbanAirshipTests.allTests),
    testCase(AudienceTests.allTests),
    testCase(CampaignsTests.allTests),
    testCase(DeviceTypesTests.allTests),
    testCase(InAppTests.allTests),
    testCase(MessageTests.allTests),
    testCase(NotificationTests.allTests),
    testCase(OptionsTests.allTests),
    testCase(BuilderTests.allTests),
    testCase(ConfigTests.allTests)
])
