// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    // Keep this aligned with Capacitor's generated name for the npm package
    // @minax/capacitor-permissions. Otherwise cap sync asks SPM for a product
    // that this package does not export.
    name: "MinaxCapacitorPermissions",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MinaxCapacitorPermissions",
            targets: ["PermissionsPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "8.0.0")
    ],
    targets: [
        .target(
            name: "PermissionsPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Plugin")
    ]
)
