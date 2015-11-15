/* ---------------------------------------------------------------------------
** InstaFilter Processor
** Final Assignment for the Introduction To Swift Programming course
** by University of Toronto.
**
** RGBAImageProcessor.swift
** <very brief file description>
**
** Author: Antoine Induni
** -------------------------------------------------------------------------*/

import Foundation

public class RGBAImageProcessor {
    let rgbaImage: RGBAImage
    var filters: [FilterProtocol]
    
    public init(rgbaImage: RGBAImage) {
        self.rgbaImage = rgbaImage
        filters =  [FilterProtocol]()
    }
    
    public func addFilter(filter:FilterProtocol) {
        filters.append(filter)
    }
    
    public func process() {
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                for filter in filters {
                    filter.transformPixel(pixel)
                }
                rgbaImage.pixels[index] = pixel
            }
        }
    }
}

public protocol FilterProtocol {
    func transformPixel(pixel: Pixel)
}

public class SimpleFilter : FilterProtocol {
    
    public init() {
    }
    
    public func transformPixel(var pixel: Pixel) {
        pixel.red = 0
        pixel.red = 0
        pixel.green = 0
        NSLog("yo");
    }
}