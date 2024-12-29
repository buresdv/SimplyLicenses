//
//  Sheet Template.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI

struct SheetTemplate<Content: View>: View
{
    let sheetType: DisplayableSheet
    
    @ViewBuilder
    var content: Content
    
    var body: some View
    {
        NavigationStack {
            content
                .navigationTitle(Text(sheetType.sheetTitle))
                .toolbar
            {
                ToolbarItem(placement: .cancellationAction)
                {
                    CloseSheetButton()
                }
            }
        }
    }
}
