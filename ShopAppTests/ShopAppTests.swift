//
//  ShopAppTests.swift
//  ShopAppTests
//
//  Created by Mike on 21/12/19.
//  Copyright © 2019 Mike. All rights reserved.
//

import XCTest
@testable import ShopApp

class ShopAppTests: XCTestCase
{
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
       
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
//        model.inputData = "AAAA-erfg-456-MIKE"
        
        //2.- when
//         XCTAssertThrowsError(try model.validatedText(validatorType: ValidatorType.productSKU), "Message u.u")
//         { (error) in
//            if let error = error as? ValidationError
//            {
//                print(error.message)
//                return XCTFail(error.message)
//            }else{
//                return XCTFail("No option available")
//            }
//        }
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
