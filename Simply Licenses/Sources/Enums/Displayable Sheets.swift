//
//  Displayable Sheets.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import Foundation
import Observation
import SwiftUICore

enum DisplayableSheet: CustomStringConvertible, Identifiable
{
    
    var id: String
    {
        return self.description
    }

    case licenseAddition
    case categoryAddition
    case licenseEditing(licenseToEdit: License)
    
    var description: String
    {
        switch self
        {
        case .licenseAddition:
            return String(localized: "interface.sheet.license-addition.description")
        case .categoryAddition:
            return String(localized: "interface.sheet.category-addition.description")
        case .licenseEditing:
            return String(localized: "interface.sheet.license-editing.description")
        }
    }

    var sheetTitle: LocalizedStringResource
    {
        switch self
        {
        case .licenseAddition:
            return "interface.sheet.license-addition.sheet-title"
        case .categoryAddition:
            return "interface.sheet.category-addition.sheet-title"
        case .licenseEditing:
            return "interface.sheet.license-editing.sheet-title"
        }
    }
}
