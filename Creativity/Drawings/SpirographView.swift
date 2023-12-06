//
//  SpirographView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 12/6/23.
//

import SwiftUI

struct SpirographView: View
{
    var body: some View
    {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Spirograph : Shape
{
    func path(in rect: CGRect) -> Path
    {
        var niftyPath = Path()
        
        return niftyPath
    }
}

#Preview ("The use of trig for pure evil lol")
{
    SpirographView()
}
