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

/// A basic image processor with a filter collction.
public class RGBAImageProcessor {
    let rgbaImage: RGBAImage
    var filters: [FilterProtocol]
    
    public init(rgbaImage: RGBAImage) {
        self.rgbaImage = rgbaImage
        filters =  [FilterProtocol]()
    }
    
    /// filters management function
    public func addFilter(filter:FilterProtocol) {
        filters.append(filter)
    }
    
    /// filters management function
    public func removeFilter(filterIndex: Int) {
        // TODO: test before removing
        filters.removeAtIndex(filterIndex)
    }
    
    /// filters management function
    public func removeAllFilters() {
        filters.removeAll()
    }
    
    /// For each pixel of the image, all the current filters are applied
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