//
//  RainbowView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 12/6/23.
//

import SwiftUI

struct RainbowView: View
{
    var body: some View
    {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Triangle : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct PrideFlag : View
{
    var width : CGFloat = 300.0
    var height : CGFloat = 200.0
    
    var body: some View
    {
        ZStack
        {
            Rectangle()
                .fill(createPrideGradient())
                .frame(width: width, height: height, alignment: .center)
            Triangle()
                .fill(transInclusive(height: height))
                .frame(width: width, height: height, alignment: .center)
        }
    }
}

#Preview ("Inclusive Gradients!")
{
    RainbowView()
}
