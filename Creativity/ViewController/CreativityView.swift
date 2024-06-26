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
                    ForEach(loadHaiku())
                    {
                        haiku in
                        
                        NavigationLink(haiku.title, destination:
                                        ArtifactView(artifact: haiku))
                    }
                }
                Section("Art", isExpanded: $canShowArt)
                {
                    ForEach(loadArt())
                    {
                        art in
                        
                        NavigationLink(art.title, destination:
                                        ArtifactView(artifact: art))
                    }
                }
                Section("Drawings", isExpanded: $canshowDrawings)
                {
                    NavigationLink("Turtles!", destination: TurtleView())
                    NavigationLink("Scribble", destination: ScribbleView())
                    NavigationLink("My funny funny tiny drawings💩", destination: CustomShapesView())
                    NavigationLink("Based pride flag🏳️‍🌈", destination: RainbowView())
                    NavigationLink("Bob Ross lol", destination: BobRossView())
                    NavigationLink("The funny shapes", destination: SpirographView())
                }
                Section("Research", isExpanded: $canShowWriting)
                {
                    NavigationLink("Shade", destination: CustomPDFView(url: shadeURL))
                    NavigationLink("Drawing", destination: CustomPDFView(url: drawingURL))
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
