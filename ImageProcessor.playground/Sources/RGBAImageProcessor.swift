/* ---------------------------------------------------------------------------
** InstaFilter Processor
** Final Assignment for the Introduction To Swift Programming course
** by University of Toronto.
**
** RGBAImageProcessor.swift
** Contains the image processor
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
    
    public func removeFilter(filterIndex: Int) {
        filters.removeAtIndex(filterIndex)
    }
    
    public func removeAllFilters() {
        filters.removeAll()
    }
    
    public func process() {
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                for filter in filters {
                    pixel = filter.transformPixel(pixel)
                }
                rgbaImage.pixels[index] = pixel
            }
        }
    }
}