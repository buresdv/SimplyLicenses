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
    var isShowingLicenseAdditionSheet: Bool = false
    
    var sheetToShow: DisplayableSheet?
    
    var isShowingCategoryAdditionSheet: Bool = false
    
    func showSheet(ofType sheetType: DisplayableSheet)
    {
        self.sheetToShow = sheetType
    }
    
    func dismissSheet()
    {
        self.sheetToShow = nil
    }
}
