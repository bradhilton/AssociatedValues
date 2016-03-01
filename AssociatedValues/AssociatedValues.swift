//
//  AssociatedValues.swift
//  AssociatedValues
//
//  Created by Bradley Hilton on 2/19/16.
//  Copyright © 2016 Brad Hilton. All rights reserved.
//

import ObjectiveC.runtime

public func getAssociatedValueForProperty<T>(property: String, ofObject object: AnyObject) -> T? {
    return (objc_getAssociatedObject(object, property.address) as? AssociatedValue)?.value as? T
}

public func getAssociatedValueForProperty<T>(property: String, ofObject object: AnyObject, @autoclosure withInitialValue initialValue: () -> T) -> T {
    return getAssociatedValueForProperty(property, ofObject: object) ?? returnInitialValue(initialValue(), forProperty: property, ofObject: object)
}

public func getAssociatedValueForProperty<T>(property: String, ofObject object: AnyObject, withInitialValue initialValue: () -> T) -> T {
    return getAssociatedValueForProperty(property, ofObject: object) ?? returnInitialValue(initialValue(), forProperty: property, ofObject: object)
}

func returnInitialValue<T>(initialValue: T, forProperty property: String, ofObject object: AnyObject) -> T {
    setAssociatedValue(initialValue, forProperty: property, ofObject: object)
    return initialValue
}

public func setAssociatedValue<T>(value: T?, forProperty property: String, ofObject object: AnyObject) {
    setAssociatedValue(AssociatedValue(value), forProperty: property, ofObject: object)
}

public func setWeakAssociatedValue<T : AnyObject>(value: T?, forProperty property: String, ofObject object: AnyObject) {
    setAssociatedValue(AssociatedValue(weak: value), forProperty: property, ofObject: object)
}

extension String {
    
    private var address: UnsafePointer<Void> {
        return UnsafePointer<Void>(bitPattern: abs(hashValue))
    }
    
}

private func setAssociatedValue(associatedValue: AssociatedValue, forProperty property: String, ofObject object: AnyObject) {
    objc_setAssociatedObject(object, property.address, associatedValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
}

private class AssociatedValue {
    
    weak var _weakValue: AnyObject?
    var _value: Any?
    
    var value: Any? {
        return _weakValue ?? _value
    }
    
    init(_ value: Any?) {
        _value = value
    }
    
    init(weak: AnyObject?) {
        _weakValue = weak
    }
    
}
