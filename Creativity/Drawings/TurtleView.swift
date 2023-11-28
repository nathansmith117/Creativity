//
//  TurtleView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 11/28/23.
//

import SwiftUI

struct TurtleView: View
{
    var body: some View
    {
        ZStack
        {
            Turtle()
                .fill(Color.green)
            Sun()
                .fill(Color.yellow)
                .overlay(Sun().stroke(Color.orange, lineWidth: 5))
        }
    }
}

struct Turtle : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var logoPath = Path()
        
        logoPath.move(to: CGPoint(x: 10, y: 10))
        logoPath.addLine(to: CGPoint(x: 50, y: 50))
        logoPath.addLine(to: CGPoint(x: 10, y: 90))
        logoPath.closeSubpath()
        
        return logoPath
    }
}

struct Sun : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var shinyPath = Path()
        
        shinyPath.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        shinyPath.addArc(center: CGPoint(x: rect.maxX, y: rect.minY),
                         radius: 150,
                         startAngle: Angle(radians: (Double.pi / 2)),
                         endAngle: Angle(radians: Double.pi),
                         clockwise: false)
        
        shinyPath.closeSubpath()
        
        return shinyPath
    }
}

#Preview ("Turtles!")
{
    TurtleView()
}
