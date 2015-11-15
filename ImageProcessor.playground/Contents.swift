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

imageProcessor.addFilter(SimpleFilter())

imageProcessor.process()

let newImage = rgbaImage.toUIImage()






