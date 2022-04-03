//
//  FormField.swift
//  FlexLayoutApp
//
//  Created by Amol Chaudhari on 04/05/21.
//

import Foundation

struct FormField: Identifiable {
    let id = UUID()
    var percentage: Float = 0
    var min: Float?
    var max: Float?
    
    static func all() -> [FormField] {
        var records = [FormField]()
        records.append(FormField(percentage: 0, min: 100, max: 200))
        records.append(FormField(percentage: 0, min: 100, max: 300))
        records.append(FormField(percentage: 30))
        records.append(FormField(percentage: 30))
        records.append(FormField(percentage: 30))
        records.append(FormField(percentage: 40))
        records.append(FormField(percentage: 40))
        records.append(FormField(percentage: 40))
        records.append(FormField(percentage: 30))
        records.append(FormField(percentage: 80, min: 200, max: 300))

        return records
    }
}
