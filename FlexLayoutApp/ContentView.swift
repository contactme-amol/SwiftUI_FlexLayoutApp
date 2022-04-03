//
//  ContentView.swift
//  FlexLayoutApp
//
//  Created by Amol Chaudhari on 04/05/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    let records = FormField.all()
    
    private func getFrameForFormField(size: CGSize, field: FormField) -> CGFloat {
        let fieldWidth = Float(size.width)/100.0*field.percentage
        let minMaxWidth = fieldWidth.minMaxValue(width: Float(size.width), min: field.min, max: field.max)
        return CGFloat(minMaxWidth)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let chunked = records.chunked(width: Float(geometry.size.width))
            VStack(alignment: .leading) {
                List {
                    //Row
                    ForEach(0..<chunked.count) { index in
                        HStack {
                            ForEach(chunked[index]) { field in
                                VStack {
                                    Text("\(Int(field.percentage))")
                                        .frame(width: self.getFrameForFormField(size: geometry.size, field: field), height: 48, alignment: .center)
                                        .background(Color.red)
                                }
                            }
                        }.background(Color.yellow)
                    }
                }
            }.background(Color.red)
        }.background(Color.red)
    }
}

extension Float {
    func minMaxValue(width: Float, min: Float? = nil, max: Float? = nil) -> Float {
        
        if min ?? 0.0 > max ?? 0.0 {
            return self
        }
        
        if let min = min, self < min {
            return min
        }
        
        if let max = max, self > max {
            return max
        }
        
        return self
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
