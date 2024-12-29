//
//  Displayable Errors.swift
//  Simply Licenses
//
//  Created by David Bureš on 02.12.2024.
//

import Foundation

enum DisplayableAlert: LocalizedError
{
    case couldNotInitializeSwiftDataStorage(error: LocalizedError)
    
    case forbiddenToDeleteLastLicenseKey
    
    case genericWithLocalizedError(error: LocalizedError)
}
