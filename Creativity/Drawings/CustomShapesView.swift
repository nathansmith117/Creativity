//
//  CustomShapesView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 12/6/23.
//

import SwiftUI

struct CustomShapesView: View
{
    var body: some View
    {
        VStack()
        {
            CarShape()
                .stroke(Color.black, lineWidth: 2)
            UfoShape()
                .stroke(Color.black, lineWidth: 2)
            SpaceshipShape()
                .stroke(Color.black, lineWidth: 2)
        }
    }
}

struct UfoShape : Shape
{
    
    func path(in rect : CGRect) -> Path
    {
        var path : Path
        
        let points : [CGPoint] = [
            CGPoint(x: 0, y: 2),
            CGPoint(x: 1, y: 1),
            CGPoint(x: 2, y: 1),
            CGPoint(x: 3, y: 0),
            CGPoint(x: 5, y: 0),
            CGPoint(x: 6, y: 1),
            CGPoint(x: 2, y: 1),
            CGPoint(x: 7, y: 1),
            CGPoint(x: 8, y: 2),
            CGPoint(x: 0, y: 2),
        ]
        
        
        path = pathFromPointArray(from: points, at: CGPoint(x: rect.midX, y: rect.midY), scale: 20.0)
        path.closeSubpath()
        
        return path
    }
}

struct SpaceshipShape : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var path : Path
        
        let points : [CGPoint] = [
            CGPoint(x: 5, y: 0),
            CGPoint(x: 0, y: 6),
            CGPoint(x: 1, y: 7),
            CGPoint(x: 2, y: 6),
            CGPoint(x: 5, y: 6),
            CGPoint(x: 5, y: 0),
        ]
        
        path = pathFromPointArray(from: points, at: CGPoint(x: rect.midX - 51, y: rect.midY), scale: 10.0)
        path.closeSubpath()
        let mirror = verticalMirror(of: path, in: rect)
        path.addPath(mirror)
        path.closeSubpath()
        
        return path
    }
}

struct CarShape : Shape
{
    func path(in rect : CGRect) -> Path
    {
        var path : Path
        
        let points : [CGPoint] = [
            CGPoint(x: 0.0, y: 5.0),
            CGPoint(x: 1.0, y: 3.0),
            CGPoint(x: 1.0, y: 2.0),
            CGPoint(x: 2.0, y: 2.0),
            CGPoint(x: 3.0, y: 1.0),
            CGPoint(x: 4.0, y: 1.0),
            CGPoint(x: 5.0, y: 0.0),
            CGPoint(x: 8.0, y: 0.0),
            CGPoint(x: 9.0, y: 1.0),
            CGPoint(x: 9.0, y: 2.0),
            CGPoint(x: 10.0, y: 3.0),
            CGPoint(x: 11.0, y: 3.0),
            CGPoint(x: 11.0, y: 5.0),
            CGPoint(x: 10.0, y: 4.0),
            CGPoint(x: 9.0, y: 4.0),
            CGPoint(x: 9.0, y: 5.0),
            CGPoint(x: 3.0, y: 5.0),
            CGPoint(x: 2.0, y: 4.0),
            CGPoint(x: 1.0, y: 4.0),
        ]
        
        path = pathFromPointArray(from: points, at: CGPoint(x: rect.midX, y: rect.midY), scale: 10.0)
        path.closeSubpath()
        path.addPath(createPolyPath(at: CGPoint(x: rect.midX + 15.0, y: rect.midY + 50.0), radius: 7.0, lineCount: 16))
        path.addPath(createPolyPath(at: CGPoint(x: rect.midX + 98.0, y: rect.midY + 50.0), radius: 7.0, lineCount: 16))
        path.closeSubpath()
        
        return path
    }
}

#Preview ("Lots of funny funny shapes lol")
{
    CustomShapesView()
}
