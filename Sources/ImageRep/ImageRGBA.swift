
public struct ImageRGBA {
    
    private let _pixels: [Pixel]
    private let _width: Int
    private let _height: Int
    
    internal init(pixels: [Pixel], width: Int, height: Int) {
        guard (pixels.count == width * height) else {
            fatalError("ERROR::NUMBER_OF_PIXELS_DOES_NOT_MATCH_IMAGE_SIZE")
        }
        self._pixels = pixels
        self._width = width
        self._height = height
    }
    
    internal init(bytes: [UInt8], width: Int, height: Int) {
        guard (bytes.count == width * height * 4) else {
            fatalError("ERROR::NUMBER_OF_BYTES_DOES_NOT_MATCH_IMAGE_SIZE")
        }
        self._pixels = bytes.chunked(into: 4).map { chunk in
            Pixel(red: chunk[0], green: chunk[1], blue: chunk[2], alpha: chunk[3])
        }
        self._width = width
        self._height = height
    }
}

extension ImageRGBA {
    public var pixels: [Pixel] {  _pixels }
    public var width: Int { _width }
    public var height: Int { _height }
    
    public var rgbaBytes: [UInt8] { _pixels.flatMap { $0.rgbaBytes } }
    public var argbBytes: [UInt8] { _pixels.flatMap { $0.argbBytes } }
    public var bgraBytes: [UInt8] { _pixels.flatMap { $0.bgraBytes } }
    public var abgrBytes: [UInt8] { _pixels.flatMap { $0.abgrBytes } }
    public var rgbBytes: [UInt8] { _pixels.flatMap { $0.rgbBytes } }
    
}

extension ImageRGBA: Equatable { }

public struct Image565 {
    private let _pixels: [Pixel565]
    private let _width: Int
    private let _height: Int
    internal init(pixels: [Pixel565], width: Int, height: Int) {
        guard (pixels.count == width * height) else {
            fatalError("ERROR::NUMBER_OF_PIXELS_DOES_NOT_MATCH_IMAGE_SIZE")
        }
        self._pixels = pixels
        self._width = width
        self._height = height
    }
}

extension Image565 {
    public var pixels: [Pixel565] { _pixels }
    public var width: Int { _width }
    public var height: Int { _height }
    
    public var bytes: [UInt8] { pixels.flatMap { $0.bytes } }
}

extension Image565: Equatable { }
