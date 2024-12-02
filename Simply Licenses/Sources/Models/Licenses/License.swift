//
//  License.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class License: Identifiable, Hashable
{
    @Relationship(deleteRule: .cascade)
    var category: LicenseCategory?

    var softwareName: String
    
    @Attribute(.externalStorage)
    var softwareIconData: Data?

    @Relationship(deleteRule: .cascade)
    var licenseKey: [LicenseKey]

    init(category: LicenseCategory? = nil, softwareName: String, softwareIconData: Data? = nil, licenseKey: [LicenseKey])
    {
        self.category = category
        self.softwareName = softwareName
        self.softwareIconData = softwareIconData
        self.licenseKey = licenseKey
    }
}

extension License
{
    var numberOfLicenses: Int
    {
        return licenseKey.count
    }
}

@Model
class LicenseKey: Identifiable
{
    @Relationship(inverse: \License.licenseKey)
    var key: String
    
    init(key: String) {
        self.key = key
    }
}
