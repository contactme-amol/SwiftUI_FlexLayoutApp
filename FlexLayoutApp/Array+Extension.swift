//
//  Array+Extension.swift
//  FlexLayoutApp
//
//  Created by Amol Chaudhari on 04/05/21.
//

import Foundation

extension Array {
    func chunked(width: Float) -> [[Element]] {
        var mainArray = [[Element]]()
        var position = 0
        for index in 0...self.count - 1 {
            var availableWidth = width
            if mainArray.count > position {
                let nestedArray = mainArray[position]
                for item in nestedArray {
                    if let field = item as? FormField {
                        let space = (width/100*field.percentage)
                        let minMaxWidth = space.minMaxValue(width: width, min: field.min, max: field.max)
                        availableWidth -= minMaxWidth
                    }
                }
            }
            if let item = self[index] as? FormField {
                let space = (width/100*item.percentage)
                let minMaxWidth = space.minMaxValue(width: width, min: item.min, max: item.max)
                if width > minMaxWidth && availableWidth > minMaxWidth {
                    if mainArray.count > position {
                        var record = mainArray[position]
                        record.append(self[index])
                        mainArray[position] = record
                    } else {
                        mainArray.append([self[index]])
                    }
                } else {
                    position += 1
                    mainArray.append([self[index]])
                }
            }
        }
        return mainArray
    }
}
