//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Jane Appleseed on 10/17/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //Mark: meal class tests
    
    //confirm that the meal initialiser returns a meal object when passes valid parameters
    
    func testMealInitialisationSucceeds(){
        
        //zero rating
        
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //highest positive rating
        
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)

    }
    
    //confirm that the meal initialiser returns nil when passed a negative rating or an empty name
    func testMealInitializationFails(){
        
        //negative rating
        let negativeRatingMeal = Meal.init(name: "negative",photo: nil,rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "large",photo: nil,rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        //empty string
        let emptyStringMeal = Meal.init(name: "",photo: nil,rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
    
    
}
