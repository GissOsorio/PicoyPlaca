//
//  PicoyPlacaTests.swift
//  PicoyPlacaTests
//
//  Created by Gisela Osorio on 16/6/22.
//

import XCTest
@testable import PicoyPlaca

class PicoyPlacaTests: XCTestCase {

    
    func testFunctionPlateValidationToShowSuccess() throws{
//        given
        let brain = Brain()
        let testPlate = "ABC-123"
//        when
        let result = brain.plateValidation(plate: testPlate)
//        then
        XCTAssertTrue(result)
    }
    
    func testFunctionPlateValidationToShowFailure() throws{
//        given
        let brain = Brain()
        let testPlate = "ABC-DEF"
//        when
        let result = brain.plateValidation(plate: testPlate)
//        then
        XCTAssertFalse(result)
    }
    
    func testFunctionDateValidationToShowSuccess() throws{
//        given
        let brain = Brain()
        let testDate = "01-01-2022"
//        when
        let result = brain.dateValidation(date: testDate)
//        then
        XCTAssertTrue(result)
    }
    
    func testFunctionDateValidationToShowFailure() throws{
//        given
        let brain = Brain()
        let testDate = "01-01-11"
//        when
        let result = brain.dateValidation(date: testDate)
//        then
        XCTAssertFalse(result)
    }

    func testFunctionDateToDayWeekSuccess() throws{
//        given
        let brain = Brain()
        let testDate = "16-06-2022"
//        when
        let result = brain.dateToDayWeek(dateString: testDate)
//        then
        XCTAssertEqual(result, "Thursday")
    }
    
    func testFunctionDateToDayWeekFailure() throws{
//        given
        let brain = Brain()
        let testDate = "17-06-2022"
//        when
        let result = brain.dateToDayWeek(dateString: testDate)
//        then
        XCTAssertEqual(result, "Thursday")
    }
}
