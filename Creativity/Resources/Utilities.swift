//
//  Utilities.swift
//  Creativity
//
//  Created by Smith, Nathanael on 11/30/23.
//

import SwiftUI

let demoArtifact : Artifact = Artifact(filename: "Programming Haiku",
                                       title: "Programming Haiku!!!", artist: "me",
                                       description: "A quite wacky programming haiku")

func verticalMirror(of path : Path, in rect : CGRect) -> Path
{
    var mirrored = Path()
    
    mirrored.addPath(path)
    mirrored = mirrored.applying(CGAffineTransform(translationX: -rect.origin.x, y: 0))
    mirrored = mirrored.applying(CGAffineTransform(scaleX: -1, y: 1))
    mirrored = mirrored.applying(CGAffineTransform(translationX: rect.origin.x + rect.width, y: 0))
    
    return mirrored
}

func horizontalMirror(of path : Path, in rect : CGRect) -> Path
{
    var mirrored = Path()
    
    mirrored.addPath(path)
    mirrored = mirrored.applying(CGAffineTransform(translationX: 0, y: -rect.origin.y))
    mirrored = mirrored.applying(CGAffineTransform(scaleX: 1, y: -1))
    mirrored = mirrored.applying(CGAffineTransform(translationX: 0, y: rect.origin.y + rect.height))
    
    return mirrored
}

func pathFromPointArray(from points: [CGPoint], at position: CGPoint, scale: CGFloat) -> Path
{
    var path = Path()
    
    path.move(to: CGPoint(x: points[0].x * scale + position.x, y: points[0].y * scale + position.y))
    
    for index in 1 ..< points.count
    {
        path.addLine(to: CGPoint(x: points[index].x * scale + position.x, y: points[index].y * scale + position.y))
    }
    
    return path
}

let brown : Color = Color(red: (101.0 / 255.0), green: (67.0 / 255.0), blue: (33.0 / 255.0))

func createPrideGradient() -> LinearGradient
{
    let prideColors : [Color] = [.red, .red, .orange, .yellow, .green, .blue, .purple, .purple]

    let gradient = LinearGradient(gradient: Gradient(colors: prideColors), startPoint: .top, endPoint: .bottom)
    
    return gradient
}

func transInclusive(height: CGFloat) -> RadialGradient
{
    let colors = Gradient(colors: [.white, .pink, .blue, brown, .black, .black])
    
    let conic = RadialGradient(gradient: colors, center: .leading, startRadius: 1, endRadius: height / 2)
    
    return conic
}

extension View
{
    public func gradientForeground(gradientColors: [Color]) -> some View
    {
        self.overlay(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}

func createPolyPath(at position: CGPoint, radius: Double, lineCount: Int) -> Path
{
    var path = Path()
    
    path.move(to: CGPoint(x: position.x, y: position.y + radius))
    
    for lineNum in 0 ..< lineCount
    {
        var angle: Double = (Double)(lineNum) * (360.0 / (Double)(lineCount))
        angle = angle * Double.pi / 180.0
        
        var xRotation = radius * sin(angle)
        var yRotation = radius * cos(angle)
        
        xRotation += position.x
        yRotation += position.y
        
        path.addLine(to: CGPoint(x: xRotation, y: yRotation))
    }
    
    path.closeSubpath()
    
    return path
}
