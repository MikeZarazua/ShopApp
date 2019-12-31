//
//  ObligatoryFieldTest.swift
//  ShopAppTests
//
//  Created by Mike on 12/30/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import XCTest
@testable import ShopApp

class ObligatoryFieldTest: XCTestCase {
    //The unit test below will verify the validation for the input data provided in the textfields
    var model: AddProductProtocol!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model = AddProductModelItem(inputData: "", cellType: .textField, cellSubtype: .productSKU, obligatory: true, title: "Some title", errorMessage: "The field is obligatory", keyboardInputType: .default)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        model = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    /**
     This function must failed, becasuse the input data is an empty string, So the test must return a throw error
     **/
    func testObligarotyInputData()
    {
        model.inputData = ""
        XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.requiredField(field: "Requiered Field")), "Requiered Field") { (error) in
            guard let error = error as? ValidationError else{
                return XCTFail("No valid Validation error")
            }
            XCTAssertTrue(true, error.message)
        }
    }
    
    /**
        This function must failed, becasuse the input data is an empty string even if only set white spaces So the test must return a throw error
        **/
       func testWhiteSpaceInputData()
       {
           model.inputData = "                 "
           XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.requiredField(field: "Requiered Field")), "Requiered Field") { (error) in
               guard let error = error as? ValidationError else{
                   return XCTFail("No valid Validation error")
               }
               XCTAssertTrue(true, error.message)
           }
       }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
