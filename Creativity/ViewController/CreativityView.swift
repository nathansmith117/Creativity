//
//  ContentView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 11/28/23.
//

import SwiftUI

struct CreativityView: View
{
    var body: some View
    {
        VStack
        {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview ("Creativity view preview")
{
    CreativityView()
}
