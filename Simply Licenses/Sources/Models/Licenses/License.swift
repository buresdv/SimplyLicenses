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

    var softwareName: String = ""
    
    @Attribute(.externalStorage)
    var softwareIconData: Data?

    var licenseKey: [LicenseKey]?

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
        return licenseKey?.count ?? 0 // Safe access to optional array
    }
}

@Model
class LicenseKey: Identifiable
{
    var key: String = ""
    
    var license: License?
    
    init(key: String) {
        self.key = key
    }
}
