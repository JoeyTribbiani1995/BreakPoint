//
//  Group.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/18/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation

class Group {
    private var _groupTitle : String
    private var _groupDesc : String
    private var _key : String
    private var _memberCount : Int
    private var _members : [String]
    
    var groupTitle : String {
        return _groupTitle
    }
    
    var groupDesc : String {
        return _groupDesc
    }
    
    var members : [String] {
        return _members
    }
    
    var key : String {
        return _key
    }
    
    var memberCount : Int {
        return _memberCount
    }
    
    init(title : String , des : String , key : String , members : [String], memberCount : Int) {
        self._groupTitle = title
        self._groupDesc = des
        self._key = key
        self._members = members
        self._memberCount = memberCount
    }
    
    
}
