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

//imageProcessor.addFilter(RemoveColorFilter(selectedColor: FilterColor.Blue))

imageProcessor.addFilter(SuperChessFilter(alphaValue: 45))

imageProcessor.process()

var newImage = rgbaImage.toUIImage()

imageProcessor.addFilter(RemoveColorFilter(selectedColor: FilterColor.Red))

imageProcessor.addFilter(SetColorFilter(selectedColor: FilterColor.Red, colorValue: 255))

imageProcessor.process()

newImage = rgbaImage.toUIImage()
imageProcessor.removeAllFilters()
imageProcessor.addFilter(SuperChessFilter(alphaValue: 0))
imageProcessor.process()
newImage = rgbaImage.toUIImage()






