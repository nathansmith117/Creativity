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
        ZStack
        {
            HappyTree()
                .fill(ImagePaint(image: Image("small"), scale: 0.02))
                .overlay(HappyTree()
                    .stroke(Color.green, lineWidth: 10))
            MultiPath()
                .fill(Color.purple.opacity(0.33))
        }
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
        
        xPos -= 70
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

struct MultiPath : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var demo = Path()
        
        var currentX = Int(arc4random()) % Int(rect.maxX)
        var currentY = Int(arc4random()) % Int(rect.maxY)
        
        demo.move(to: CGPoint(x: currentX, y: currentY))
        
        for _ in 1...30
        {
            demo.addLine(to: CGPoint(x: currentX, y: currentY + 50))
            demo.addLine(to: CGPoint(x: currentX + 50, y: currentY + 50))
            demo.addLine(to: CGPoint(x: currentX + 50, y: currentY))
            demo.closeSubpath()
            
            currentX = Int(arc4random()) % Int(rect.maxX)
            currentY = Int(arc4random()) % Int(rect.maxY)
            demo.move(to: CGPoint(x: currentX, y: currentY))
        }
        
        return demo
    }
}

#Preview ("Bob Ross View")
{
    BobRossView()
}
