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
