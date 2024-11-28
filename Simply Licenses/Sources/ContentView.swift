//
//  ContentView.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View
{
    
    @Query
    var savedLicenses: [License]
    
    var body: some View
    {
        NavigationSplitView(columnVisibility: Binding(get: {
            savedLicenses.isEmpty ? .doubleColumn : .all
        }, set: { visibility in
            visibility
        }))
        {
            SidebarView()
        } content: {
            Text("Hello")
        } detail: {
            Text("Detail")
        }

    }
}

#Preview
{
    ContentView()
}
