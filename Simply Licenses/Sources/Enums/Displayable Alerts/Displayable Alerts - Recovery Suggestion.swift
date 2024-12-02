//
//  Displayable Alerts - Recovery Suggestion.swift
//  Simply Licenses
//
//  Created by David Bureš on 02.12.2024.
//

import Foundation

extension DisplayableAlert
{
    var recoverySuggestion: String?
    {
        switch self
        {
        case .forbiddenToDeleteLastLicenseKey:
            return String(localized: "alert.forbidden-to-delete-last-key.description")
        case .genericWithLocalizedError(let error):
            return error.recoverySuggestion
        }
    }
}
