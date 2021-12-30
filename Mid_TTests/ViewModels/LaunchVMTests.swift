//
//  LaunchVMTests.swift
//  Mid_TTests
//
//  Created by Pavle Mijatovic on 30.12.21..
//

import XCTest
@testable import Mid_T

class LaunchVMTests: XCTestCase {

    func testLaunchVM() throws {
        let launchRocket = LaunchRocket(rocketName: "Falcon 1", rocketType: "Merlin A")
        let links = Links(missionPatchSmall: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")
        let launchFailureDetails = LaunchFailureDetails(reason: "merlin engine failure")
        let launch = Launch(id: UUID(), missionName: "FalconSat", launchDateUnix: 1143239400, launchDateUtc: "2006-03-24T22:30:00.000Z", launchDateLocal: "2006-03-25T10:30:00+12:00", rocket: launchRocket, links: links, launchSuccess: false, launchFailureDetails: launchFailureDetails, details: "Engine failure at 33 seconds and loss of vehicle", launchYear: "2006")
        let launchVM = LaunchVM(launch: launch)

        XCTAssert(launchVM.missionInfo == "FalconSat")
        XCTAssert(launchVM.dateTimeInfo == "Mar 24, 2006 at 11:30:00 PM")
        XCTAssert(launchVM.rocketInfo == "Falcon 1/Merlin A")
        XCTAssert(launchVM.daysLabel == "Days from now: ")
        XCTAssert(launchVM.daysInfo == "5760")
        XCTAssert(launchVM.launchSuccess == false)
        XCTAssert(launchVM.missionImageUrlString == "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")
        XCTAssert(launchVM.imageSuccessIconName == "x_mark")
    }
}
