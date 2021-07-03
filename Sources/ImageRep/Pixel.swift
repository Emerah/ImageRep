
public struct Pixel {
    private let _red: UInt8
    private let _green: UInt8
    private let _blue: UInt8
    private let _alpha: UInt8
    public init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        (_red, _green, _blue, _alpha) = (red, green, blue, alpha)
    }
}

extension Pixel {
    
    public var red: UInt8 { _red }
    public var green: UInt8 { _green }
    public var blue: UInt8 { _blue }
    public var alpha: UInt8 { _alpha }

    public var rgbaBytes: [UInt8] {
        [red, green, blue, alpha]
    }
    
    public var bgraBytes: [UInt8] {
        [blue, green, red, alpha]
    }
    
    public var abgrBytes: [UInt8] {
        [alpha, blue, green, red]
    }
    
    public var argbBytes: [UInt8] {
        [alpha, red, green, blue]
    }
    
    public var rgbBytes: [UInt8] {
        [red, green, blue]
    }
}

extension Pixel: Equatable { }

public struct Pixel565 {
    private let _value: UInt16
    private let _bytes: [UInt8]
    
    public init(value: UInt16) {
        self._value = value
        self._bytes = [UInt8(value >> 8), UInt8(value & 0x00ff)]
    }
    
    public init(bytes: [UInt8]) {
        guard bytes.count == 2 else { fatalError("ERROR::CANNOT_CONVERT_MORE_THAN_2_BYTES_TO_UINT16") }
        self._bytes = bytes
        self._value = UInt16(bytes[0]) << 8 | UInt16(bytes[1])
    }
}

extension Pixel565 {
    public var bytes: [UInt8] { _bytes }
    public var value: UInt16 { _value }
}

extension Pixel565: Equatable { }
