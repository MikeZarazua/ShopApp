//
//  PriceValidationTest.swift
//  ShopAppTests
//
//  Created by Mike on 30/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import XCTest
@testable import ShopApp


class PriceValidationTest: XCTestCase {

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

    /**
     The price  regex  force the string to be only with number, so any string that is made it of number willpass the test
     **/
    func testValidaPrice()
    {
        //1.-given
        model.inputData = "3000000"
        //2.-When   3.-Then
        XCTAssertNoThrow(try model.validatedText(validatorType: ValidatorType.productPrice), "Correct Form")
        
    }
    
    func testInvalidatePrice()
    {
        //1.-given
        model.inputData = "C3PO"
        //2.-When   3.-Then
        XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.productPrice), "Error, the string is not made it of only numbers") { (error) in
            guard let error = error as? ValidationError else{
                print("Couldn't set let error = error as? ValidationError ")
                return XCTFail("No valid option")
            }
            XCTAssertTrue(true, error.message)
        }
    }
}
