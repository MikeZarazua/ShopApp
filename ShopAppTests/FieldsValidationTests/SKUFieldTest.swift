//
//  SKUFieldTest.swift
//  ShopAppTests
//
//  Created by Mike on 12/30/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import XCTest
@testable import ShopApp

class SKUFieldTest: XCTestCase
{

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
        This function evaluates only correct inputs for the SKU field
        The regex is ^([A-H-J-Za-z]){4}-([a-z]){4}-([2-9]){3}-MIKE$
        - Where indicates that the letter i uppercase ("I") is not valid, as the number 0 or 1 in order to do not confuse this characters
        - The SKU sentence must end with MIKE, becasue that is my name and it is only as
        Examples of valid inputs:
        -ADFG-fegt-987-MIKE
        -freg-dwef-456-MIKE
        **/
    func testValidSKUValue()
    {
        //1.-given
        model.inputData = "AAAA-erfg-456-MIKE"
        
        //2.- When 3.- Then
        XCTAssertNoThrow(try model.validatedText(validatorType: ValidatorType.productSKU))
    }
        
    /**
     This function evaluates the first section, where the first section must be only letters(4), exception with letter "I", number 1,
     **/
    func testFirstSKUSection()
    {
        //1.-Given
        model.inputData = "232d-erfg-234-MIKE"
        //2.-When  3.-Then
        XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.productSKU))
    }
    
    /**
    This function evaluates the Second section, where the second section must be only letters(4) in lowercase
    **/
    func testSecondSKUSection()
    {
        //1.-Given
        model.inputData = "AAAA-er2f3g-456-MIKE"
        //2.-When  3.-Then
        XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.productSKU), "SKU failed validation") { (error) in
            guard let error = error as? ValidationError else{
                return XCTFail("No valid Validation error")
            }
            XCTAssertTrue(true, error.message)
        }
    }
    
    /**
    This function evaluates the Thirth section, where the Thirth section must be only numbers(3)
    **/
    func testThirthSection()
    {
        //1.-Given
        model.inputData = "AAAA-fghj-4e5-MIKE"
        //2.-When  3.-Then
        XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.productSKU), "SKU failed validation") { (error) in
            guard let error = error as? ValidationError else{
                return XCTFail("No valid Validation error")
            }
            XCTAssertTrue(true, error.message)
        }
    }
    
    /**
    This function evaluates the Fourth section, where the Thirth section must be only numbers(3)
    **/
    func testFourthSection()
    {
        //1.-Given
        model.inputData = "AAAA-fghj-455-NIKE"
        //2.-When  3.-Then
        XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.productSKU), "SKU failed validation") { (error) in
            guard let error = error as? ValidationError else{
                return XCTFail("No valid Validation error")
            }
            XCTAssertTrue(true, error.message)
        }
    }
    
    func testInvalidSKUValue()
    {
        //1.- given
        model.inputData = "AAAA-erf3g-456-MIKE"
        //2.- When
        XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.productSKU), "SKU failed validation") { (error) in
            guard let error = error as? ValidationError else{
                return XCTFail("No valid Validation error")
            }
            XCTAssertTrue(true, error.message)
        }

    }
}
