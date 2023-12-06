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
    var scalar: Double = 20.0
    var increment: Double = 0.5
    var repetitions: Double = 360.0
    var smallRadius: Double = 10
    var largeRadius: Double = 17
    
    func path(in rect: CGRect) -> Path
    {
        var niftyPath = Path()
        
        var currentX = Double(rect.midX)
        var currentY = Double(rect.midY)
        
        niftyPath.move(to: CGPoint(x: currentX, y: currentY))
        
        for theta in stride(from: 0.0, to: repetitions, by: increment)
        {
            let deltaX = cos(theta) * (largeRadius - smallRadius) + scalar * cos((smallRadius - largeRadius) * (theta / smallRadius))
            let deltaY = sin(theta) * (largeRadius - smallRadius) + scalar * sin((smallRadius - largeRadius) * (theta / smallRadius))
            
            currentX += deltaX
            currentY += deltaY
            
            niftyPath.addLine(to: CGPoint(x: currentX, y: currentY))
        }
        
        return niftyPath
    }
}

#Preview ("The use of trig for pure evil lol")
{
    SpirographView()
}
