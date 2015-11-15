/* ---------------------------------------------------------------------------
** InstaFilter Processor
** Final Assignment for the Introduction To Swift Programming course
** by University of Toronto.
**
** ImageProcessor.playground
** <very brief file description>
**
** Author: Antoine Induni
** -------------------------------------------------------------------------*/

import UIKit

let image = UIImage(named: "sample")!

// Process the image!
let rgbaImage = RGBAImage(image: image)!

let imageProcessor = RGBAImageProcessor(rgbaImage: rgbaImage)

imageProcessor.addFilter(RemoveColorFilter(selectedColor: FilterColor.Blue))

imageProcessor.process()

var newImage = rgbaImage.toUIImage()

imageProcessor.addFilter(RemoveColorFilter(selectedColor: FilterColor.Red))

imageProcessor.addFilter(SetColorFilter(selectedColor: FilterColor.Red, colorValue: 255))

imageProcessor.process()

newImage = rgbaImage.toUIImage()
imageProcessor.removeAllFilters()
imageProcessor.addFilter(ChessFilter())
imageProcessor.process()
newImage = rgbaImage.toUIImage()






