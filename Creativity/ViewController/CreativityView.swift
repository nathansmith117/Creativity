//
//  ContentView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 11/28/23.
//

import SwiftUI

struct CreativityView: View
{
    //MARK: ~ Collapsibility
    
    @State private var canShowHaiku = false
    @State private var canShowArt = false
    @State private var canshowDrawings = false
    @State private var canShowWriting = false
    
    var body: some View
    {
        NavigationStack
        {
            List
            {
                Section("Haiku", isExpanded: $canShowHaiku)
                {
                    
                }
                Section("Art", isExpanded: $canShowArt)
                {
                    
                }
                Section("Drawings", isExpanded: $canshowDrawings)
                {
                    
                }
                Section("Research", isExpanded: $canShowWriting)
                {
                    
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

#Preview ("Creativity view preview")
{
    CreativityView()
}
