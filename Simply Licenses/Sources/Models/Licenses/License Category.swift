//
//  License Category.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import Foundation
import SwiftData

@Model
class LicenseCategory
{
    var name: String
    
    @Relationship(inverse: \License.category)
    var licenses: [License]
    
    init(name: String, licenses: [License]) {
        self.name = name
        self.licenses = licenses
    }
}
