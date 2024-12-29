//
//  Sidebar View.swift
//  Simply Licenses
//
//  Created by David Bureš on 28.11.2024.
//

import SwiftUI
import SwiftData

struct SidebarView: View
{
    @Binding var selectedCategory: LicenseCategory?
    
    @Query
    var categories: [LicenseCategory]
    
    var body: some View
    {
        if categories.isEmpty
        {
            Text("status.no-categories-available")
                .toolbar(removing: .sidebarToggle)
        }
        else
        {
            List(selection: $selectedCategory)
            {
                ForEach(categories)
                { category in
                    Text(category.name ?? "category.name-missing")
                }
            }
        }
    }
}
