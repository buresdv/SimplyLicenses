//
//  Displayable Alerts - Description.swift
//  Simply Licenses
//
//  Created by David Bureš on 02.12.2024.
//

import Foundation

extension DisplayableAlert
{
    /// The bold text at the top of the error
    var errorDescription: String?
    {
        switch self
        {
        case .forbiddenToDeleteLastLicenseKey:
            return String(localized: "alert.forbidden-to-delete-last-key.title")
        case .genericWithLocalizedError(let error):
            return error.errorDescription
        }
    }
}
