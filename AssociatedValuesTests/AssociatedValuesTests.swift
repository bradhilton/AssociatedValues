//
//  AssociatedValuesTests.swift
//  AssociatedValuesTests
//
//  Created by Bradley Hilton on 2/19/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import XCTest
import AssociatedValues

extension NSObject {
    
    var funnyName: String {
        get {
            return getAssociatedValueForProperty("funnyName", ofObject: self, withInitialValue: "Goofy")
        }
        set {
            setAssociatedValue(newValue, forProperty: "funnyName", ofObject: self)
        }
    }
    
    var weakRelation: NSObject? {
        get {
            return getAssociatedValueForProperty("weakRelation", ofObject: self)
        }
        set {
            setWeakAssociatedValue(newValue, forProperty: "weakRelation", ofObject: self)
        }
    }
    
}

class AssociatedValuesTests: XCTestCase {
    
    func testFunnyName() {
        let object = NSObject()
        XCTAssert(object.funnyName == "Goofy")
        for _ in 0..<100000 {
            object.funnyName = "Donald"
            XCTAssert(object.funnyName == "Donald")
        }
    }
    
    func testWeakRelation() {
        let object = NSObject()
        XCTAssert(object.weakRelation == nil)
        if true {
            let relation = NSObject()
            object.weakRelation = relation
            XCTAssert(object.weakRelation == relation)
        }
        XCTAssert(object.weakRelation == nil)
    }
    
}