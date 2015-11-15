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

/// A filter to set the value of a selected color.
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

/// A filter to remove a selected color.
public class RemoveColorFilter : SetColorFilter {
    public init(selectedColor: FilterColor) {
        super.init(selectedColor: selectedColor, colorValue: 0)
    }
}

/// A filter to replace the current image by a chessboard.
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

/// A filter to add a chessboard with alpha.
public class SuperChessFilter : FilterProtocol {
    var alphaValue: Double
    var whiteSquare: Bool
    public init(alphaValue: UInt8){
        self.alphaValue = SuperChessFilter.map(Double(alphaValue), start1: 0, stop1: 255, start2: 0, stop2: 1)
        self.whiteSquare = true
    }
    
    public func transformPixel(var pixel: Pixel) -> Pixel {
        if whiteSquare {
            pixel.red = mergeColor(pixel.red, color: 255)
            pixel.green = mergeColor(pixel.green, color: 255)
            pixel.blue = mergeColor(pixel.blue, color: 255)
        } else {
            pixel.red = mergeColor(pixel.red, color: 0)
            pixel.green = mergeColor(pixel.green, color: 0)
            pixel.blue = mergeColor(pixel.blue, color: 0)
        }
        whiteSquare = !whiteSquare
        return pixel
    }
    
    func mergeColor(bg: UInt8, color: UInt8) -> UInt8 {
        return UInt8((1.0 - alphaValue) * Double(bg) + alphaValue * Double(color))
    }
    

    /**
        Re-maps a number from one range to another.
        - should be moved in another class.
    */
    class func map(value: Double, start1: Double, stop1: Double, start2: Double, stop2: Double) -> Double {
        var newValue: Double
        let oldRange = stop1 - start1
        
        if oldRange == 0 {
            newValue = start2
        } else {
            let newRange = (stop2 - start1)
            newValue = (((value - start1) * newRange) / oldRange) + start2
        }
        
        return newValue
    }
}