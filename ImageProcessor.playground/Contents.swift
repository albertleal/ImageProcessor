/* ---------------------------------------------------------------------------
** InstaFilter Processor
** Final Assignment for the Introduction To Swift Programming course
** by University of Toronto.
**
** ImageProcessor.playground
** Test of the RGBAImageProcessor with some filters.
**
** Author: Antoine Induni
** -------------------------------------------------------------------------*/

import UIKit

// Load the original image.
let image = UIImage(named: "sample")!

// Process the image!
let rgbaImage = RGBAImage(image: image)!

let imageProcessor = RGBAImageProcessor(rgbaImage: rgbaImage)

// Let's add a 1st filter.
imageProcessor.addFilter(RemoveColorFilter(selectedColor: FilterColor.Blue))

// Creating the 1st result.
imageProcessor.process()

// Displaying the result.
var newImage = rgbaImage.toUIImage()

// Let's add a 2nd filter.
imageProcessor.addFilter(SuperChessFilter(alphaValue: 150))

// Creating the result.
imageProcessor.process()

// Displaying the result, the image is blended with a 1 pixel chessboard.
newImage = rgbaImage.toUIImage()

// Clean the filter collection.
imageProcessor.removeAllFilters()

// Add 2 others filters
imageProcessor.addFilter(RemoveColorFilter(selectedColor: FilterColor.Red))

imageProcessor.addFilter(SetColorFilter(selectedColor: FilterColor.Blue, colorValue: 255))

// Displaying the final result with a blue girl.
imageProcessor.process()

newImage = rgbaImage.toUIImage()



