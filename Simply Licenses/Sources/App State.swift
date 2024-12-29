//
//  App State.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import Foundation

@Observable
final class AppState
{    
    var sheetToShow: DisplayableSheet?
    
    var isShowingAlert: Bool = false
    private(set) var alertToShow: DisplayableAlert = .forbiddenToDeleteLastLicenseKey
    
    func showSheet(ofType sheetType: DisplayableSheet)
    {
        self.sheetToShow = sheetType
    }
    
    func dismissSheet()
    {
        self.sheetToShow = nil
    }
    
    func showAlert(ofType alertType: DisplayableAlert)
    {
        self.alertToShow = alertType
        self.isShowingAlert = true
    }
    
    func dismissAlert()
    {
        self.isShowingAlert = false
    }
}
