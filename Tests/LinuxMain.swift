import XCTest
@testable import UAPusherTests

XCTMain([
    testCase(PushUrbanAirshipTests.allTests),
    testCase(AudienceTests.allTests),
    testCase(CampaignTests.allTests),
    testCase(DeviceTypesTests.allTests),
    testCase(InAppTests.allTests),
    testCase(MessageTests.allTests),
    testCase(NotificationTests.allTests),
    testCase(OptionsTests.allTests),
    testCase(UABuilderTests.allTests)
])
