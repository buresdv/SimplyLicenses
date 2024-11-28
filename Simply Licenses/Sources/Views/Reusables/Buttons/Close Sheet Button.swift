//
//  Close Sheet Button.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI

struct CloseSheetButton: View
{
    @Environment(AppState.self) var appState: AppState
    
    var body: some View
    {
        Button {
            appState.dismissSheet()
        } label: {
            Text("action.close")
        }

    }
}

#Preview
{
    CloseSheetButton()
}
