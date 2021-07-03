// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImageRep",
    platforms: [SupportedPlatform.macOS(.v10_15)],
    products: [.library(name: "ImageRep", targets: ["ImageRep"]),],
    targets: [.target(name: "ImageRep", dependencies: [])]
)
