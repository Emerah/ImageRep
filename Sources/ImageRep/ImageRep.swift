import Foundation

// TODO: check image type and use the corrct cgimage initializer for png or jpg

public enum ImageType {
    case jpg
    case png
}

public class ImageRep {
    
    private let _image: ImageRGBA
    private let _image565: Image565
    
    public var image: ImageRGBA { _image }
    public var image565: Image565 { _image565 }
    
    public convenience init(url: URL, type: ImageType) {
        guard let provider = CGDataProvider(url: url as CFURL) else {
            fatalError("ERROR::UNRESOLVED_URL")
        }
        switch type {
        case .jpg:
            self.init(jpgDataProvider: provider)
        case .png:
            self.init(pngDataProvider: provider)
        }
    }
    
    public convenience init(path: String, type: ImageType) {
        guard let provider = CGDataProvider(filename: path) else {
            fatalError("ERROR::UNRESOLVED_PATH")
        }
        switch type {
        case .jpg:
            self.init(jpgDataProvider: provider)
        case .png:
            self.init(pngDataProvider: provider)
        }
    }
    
    private convenience init(pngDataProvider: CGDataProvider) {
        guard let image = CGImage(pngDataProviderSource: pngDataProvider, decode: nil, shouldInterpolate: true, intent: .defaultIntent) else {
            fatalError("ERROR::LOADING_CGIMAGE_FROM_PNG_DATA_PROVIDER")
        }
        self.init(image)
    }
    
    private convenience init(jpgDataProvider: CGDataProvider) {
        guard let image = CGImage(jpegDataProviderSource: jpgDataProvider, decode: nil, shouldInterpolate: true, intent: .defaultIntent) else {
            fatalError("ERROR::LOADING_CGIMAGE_FROM_JPG_DATA_PROVIDER")
        }
        self.init(image)
    }
    
    private init(_ image: CGImage) {
        guard let data = (image.dataProvider?.data) as Data? else {
            fatalError("ERROR::RETRIEVING DATA FROM IMAGE")
        }
        
        let pixels = Array(data).chunked(into: 4).map { chunk in
            Pixel(red: chunk[0], green: chunk[1], blue: chunk[2], alpha: chunk[3])
        }
        _image = ImageRGBA(pixels: pixels, width: image.width, height: image.height)
        
        let pixels565 = pixels.map { pixel -> Pixel565 in
            let red = (UInt32(pixel.red) * (31*2) + 255) / (255*2)
            let green = (UInt32(pixel.green) * 63 + 127) / 255
            let blue = (UInt32(pixel.blue) * 31 + 127) / 255
            return Pixel565(value: UInt16(red << 11) | UInt16(green << 5) | UInt16(blue))
        }
        _image565 = Image565(pixels: pixels565, width: image.width, height: image.height)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

