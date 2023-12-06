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
        VStack
        {
            PrideFlag(width: 75, height: 50)
            PrideFlag()
            Text("Inlusive Computer Science")
                .gradientForeground(gradientColors: [.red, .green, .blue, .purple, .red, .green,
                                                     .blue, .purple, .red, .green, .blue, .purple])
        }
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
