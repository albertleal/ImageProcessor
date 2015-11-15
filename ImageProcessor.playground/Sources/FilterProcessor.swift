/* ---------------------------------------------------------------------------
** InstaFilter Processor
** Final Assignment for the Introduction To Swift Programming course
** by University of Toronto.
**
** FilterProcessor.swift
** Contains the filters
**
** Author: Antoine Induni
** -------------------------------------------------------------------------*/

import Foundation

public enum FilterColor {
    case Red
    case Green
    case Blue
}

public protocol FilterProtocol {
    func transformPixel(pixel: Pixel) -> Pixel
}


public class SetColorFilter : FilterProtocol {
    let selectedColor: FilterColor
    let colorValue: UInt8
    
    public init(selectedColor: FilterColor, colorValue: UInt8) {
        self.selectedColor = selectedColor
        self.colorValue = colorValue
    }
    
    public func transformPixel(var pixel: Pixel) -> Pixel {
        switch selectedColor {
        case .Red:
            pixel.red = colorValue
        case .Green:
            pixel.green = colorValue
        case .Blue:
            pixel.blue = colorValue
        }
        
        return pixel
    }
}

public class RemoveColorFilter : SetColorFilter {
    public init(selectedColor: FilterColor) {
        super.init(selectedColor: selectedColor, colorValue: 0)
    }
}

public class ChessFilter : FilterProtocol {
    var pixelNumber: Int
    public init(){
        self.pixelNumber = 0
    }
    
    public func transformPixel(var pixel: Pixel) -> Pixel {
        if pixelNumber % 2 == 0 {
            pixel.red = 255
            pixel.green = 255
            pixel.blue = 255
        } else {
            pixel.red = 0
            pixel.green = 0
            pixel.blue = 0
        }
        pixelNumber++
        return pixel
    }
}