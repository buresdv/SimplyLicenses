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

    var softwareName: String?
    
    @Attribute(.externalStorage)
    var softwareIconData: Data?

    var licenseKey: [String]?

    init(category: LicenseCategory? = nil, softwareName: String? = nil, softwareIconData: Data? = nil, licenseKey: [String]? = nil)
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
        if let licenseKey
        {
            return licenseKey.count
        }
        else
        {
            return 0
        }
    }
}
