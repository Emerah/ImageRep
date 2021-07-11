# ImageRep

## Overview

This package facilitates working with images. Use this package to get fast access to image pixels or image bytes array. 

Pass a valid `URL`  or `String` path to an image [`JPG`, `PNG`] to an instance of `ImageRep` and get access to 2 types of image structures: [ImageRGBA, Pixel], and [Image565, Pixel565] 

## Usage

Add the package to your swift project and `import ImageRep`.

## Data Structure:

        - Pixel: enables various organizations of the pixel components:
        
            * individual color components: red, green, blue, alpha
            * bytes array: rgbaBytes, argbBytes, bgraBytes, abgrBytes, and rgbBytes
        
        - ImageRGBA: user can not directly inistantiate an ImageRGBA. it is rather created by the ImageRep class and given to the user through the image property
        
            * pixels: array of image pixels: Array<Pixel>
            * widht: image width
            * height: image height
            
        - Pixel565: represents a pixel in a RGB565 formatted image
        
            * pixel value: UInt16
            * pixel value in bytes array format: Array<UInt8> 
            
        - Image565: user can not directly inistantiate an Image565. it is rather crated by the ImageRep class and given to the user through the image565 property
        
            * pixels: array of image pixels in rgb565 format
            * widht: image width
            * height: image height
            * bytes: array of bytes representing the image in rgb565 format 

## Operating System:

    - macOS v10_15 and higher.
    - Swift 5.4
    
## How to use the library in you code:
            
        /* import the module */
        import ImageRep
        
        /* initialize an instance of ImageRep class with a path or url to an image on desk */
        let imageRep = ImageRep(path: "PATH_TO_IMAGE_FILE_ON_DESK", type: JPG_OR_PNG)
        
        /* get access to an instance of ImageRGBA */
        let image = imageRep.image
        
                /* now image gives you access to: */
                * image.pixels [every pixel exposes the following properties: ]
                * image.width
                * image.height
            
                /* and various bytes array layouts of the image data */
                * image.rgbaBytes
                * image.argbBytes
                * image.bgraBytes
                * image.abgrBytes
                * image.rgbBytes
        
        /* get access to an instance of Image565 */
        let image565 = imageRep.image565
        
                /* now image565 gives you access to: */
                * image565.pixels
                * image565.width
                * image565.height
            
                /* and a bytes array layouts of the image data */
                * image565.bytes
                
## Example Code

        let path = "/PATH/TO/IMAGE/ON/DESK/photo.jpg"
        let imageRep = ImageRep(path: path, type: .jpg)
        let image = imageRep.image

        image.width
        image.height
        image.pixels

        image.rgbaBytes
        image.abgrBytes
        image.argbBytes
        image.bgraBytes
        image.rgbBytes

        let image565 = imageRep.image565

        image565.width
        image565.height
        image565.pixels

        image565.bytes
        
## New in 1.1.0

    - added `cgImage` property
    - added initializing with CGDataProvider for JPG and PNG images.
    
