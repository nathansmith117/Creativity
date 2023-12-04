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
