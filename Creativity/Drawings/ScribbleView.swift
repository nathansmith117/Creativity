//
//  ScribbleView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 11/30/23.
//

import SwiftUI

struct ScribbleView: View
{
    let scribbles = [Scribble(), Scribble(), Scribble()]
    let colors : [Color] = [.green, .blue, .black, .purple, .red, .gray, .pink]
    
    var body: some View
    {
        ZStack()
        {
            makeBlueShade()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ForEach(scribbles.indices, id: \.self)
            {
                index in
                
                let randomColorIndex = Int(arc4random()) % colors.count
                let width = CGFloat(Int(arc4random()) % 8)
                
                scribbles[index].stroke(colors[randomColorIndex], lineWidth: width)
            }
            House()
                .fill(Color.red)
                .stroke(Color.orange, lineWidth: 8)
        }
    }
}

struct Scribble : Shape
{
    func path(in rect : CGRect) -> Path
    {
        return drawScribble(within: rect)
    }
    
    private func drawScribble(within bounds : CGRect) -> Path
    {
        var randomPath = Path()
        
        let startX = Int(arc4random()) % Int(bounds.midX)
        let startY = Int(arc4random()) % Int(bounds.midY)
        
        randomPath.move(to: CGPoint(x: startX, y: startY))
        
        for _ in 1 ... 100
        {
            // If your steve jobs box is extra holy you might just get the face of jesus.
            let randomX = Int(arc4random()) % Int(bounds.maxX)
            let randomY = Int(arc4random()) % Int(bounds.maxY)
            randomPath.addLine(to: CGPoint(x: randomX, y: randomY))
        }
        
        randomPath.closeSubpath()
        
        return randomPath
    }
}

struct House : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var housePath = Path()
        
        housePath.move(to: CGPoint(x: rect.maxX - 100, y: rect.maxY - 100))
        housePath.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 100))
        housePath.addLine(to: CGPoint(x: rect.maxX - 10, y: rect.maxY - 150))
        housePath.addLine(to: CGPoint(x: rect.maxX - 45, y: rect.maxY - 175))
        housePath.addLine(to: CGPoint(x: rect.maxX - 100, y: rect.maxY - 150))
        housePath.closeSubpath()
        
        return housePath
    }
}

#Preview
{
    ScribbleView()
}
