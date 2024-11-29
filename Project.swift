import ProjectDescription

func assembleSettings() -> SettingsDictionary
{
    let versionSettings: SettingsDictionary = {
        let versionSettingsObject: SettingsDictionary = .init()
            .marketingVersion("0.0.1")
            .currentProjectVersion("1")
        
        return versionSettingsObject
    }()
    
    let swiftLanguageAndCompilerSettings: SettingsDictionary = {
        let swiftLanguageAndCompilerSettingsObject: SettingsDictionary = .init()
            .swiftVersion("6.0")
        
        return swiftLanguageAndCompilerSettingsObject
    }()
    
    let baseSettings: SettingsDictionary = {
        let settingsObject: SettingsDictionary = .init()
            .automaticCodeSigning(devTeam: "ZSVA6DVZHM")
            .codeSignIdentityAppleDevelopment()
        
        return settingsObject
    }()
    
    let otherUnsupportedSettings: SettingsDictionary = [
        "SWIFT_STRICT_CONCURRENCY": "complete"
    ]
    
    return versionSettings.merging(swiftLanguageAndCompilerSettings).merging(baseSettings).merging(otherUnsupportedSettings)
}

let project = Project(
    name: "Simply Licenses",
    packages: [
        .remote(url: "https://github.com/SimplyDanny/SwiftLintPlugins", requirement: .upToNextMajor(from: "0.56.2")),
    ],
    settings: .settings(
        base: assembleSettings()
    ),
    targets: [
        .target(
            name: "Simply Licenses",
            destinations: .macOS,
            product: .app,
            bundleId: "com.davidbures.Simply-Licenses",
            sources: [
                "Simply Licenses/Sources/**"
            ],
            resources: [
                "Simply Licenses/**/*.xcassets",
                "Simply Licenses/**/*.xcstrings",
            ],
            entitlements: .file(path: "Entitlements/Simply Licenses.entitlements"),
            dependencies: [
                .package(product: "SwiftLintBuildToolPlugin", type: .plugin),
                .target(name: "Simply Licenses Shared")
            ]
        ),
        .target(
            name: "Simply Licenses Shared",
            destinations: .macOS,
            product: .staticLibrary,
            bundleId: "com.davidbures.Simply-Licenses-Shared",
            infoPlist: .default,
            sources: [
                "Modules/Shared/**/*.swift"
            ]
        ),
        .target(
            name: "Simply LicensesTests",
            destinations: .macOS,
            product: .unitTests,
            bundleId: "com.davidbures.Simply-LicensesTests",
            infoPlist: .default,
            sources: ["Simply Licenses/Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "Simply Licenses"),
                .target(name: "Simply Licenses Shared")
            ]
        ),
    ]
)
