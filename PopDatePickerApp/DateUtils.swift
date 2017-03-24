//
//  DateUtils.swift
//  iDoctors
//
//  Created by Valerio Ferrucci on 02/10/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import Foundation

extension Date {
    
    // -> Date System Formatted Medium
    func ToDateMediumString() -> NSString? {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium;
        formatter.timeStyle = .none;
        return formatter.string(from: self) as NSString?
    }
}
