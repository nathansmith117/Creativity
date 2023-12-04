//
//  BobrossView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 12/4/23.
//

import SwiftUI

struct BobRossView: View
{
    var body: some View
    {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HappyTree : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var leftPath = Path()
        var xPos = rect.midX + 3
        var yPos = rect.minY + 50.5
        
        leftPath.move(to: CGPoint(x: xPos, y: yPos))
        xPos -= 50
        yPos += 50
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos += 30
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        
        xPos += 70
        yPos += 100
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        
        xPos += 30
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        
        xPos -= 100
        yPos += 200
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        
        xPos += 120
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        yPos += 50
        
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        xPos = rect.midX
        leftPath.addLine(to: CGPoint(x: xPos, y: yPos))
        
        let rightPath = verticalMirror(of: leftPath, in: rect)
        leftPath.addPath(rightPath)
        
        return leftPath
    }
}

#Preview ("Bob Ross View")
{
    BobRossView()
}
