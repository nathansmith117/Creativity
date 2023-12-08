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

func loadHaiku() -> [Artifact]
{
    var creativityHaiku = [Artifact]()
    
    let editor = Artifact(filename: "TextEditorHaiku", title: "The text editor haiku", artist: "The depths of the universe", description: "A funny funny text editor haiku")
    let programmingLanguage = Artifact(filename: "ProgrammingHaiku", title: "The programming language haiku", artist: "The depths of my downloads folder", description: "A very true programming language haiku")
    let OSHaiku = Artifact(filename: "OSHaiku", title: "The OS haiku", artist: "Tux The Penguin", description: "A quite funnies OS haiku")
    
    creativityHaiku.append(editor)
    creativityHaiku.append(programmingLanguage)
    creativityHaiku.append(OSHaiku)
    
    return creativityHaiku
}

func loadArt() -> [Artifact]
{
    var computerPieces : [Artifact]
    
    let pieceOne = Artifact(filename: "ThePersistenceOfMemory", title: "The Persistence of Memory", artist: "Salvador Dalí", description: "One of the most well know pieces of surrealist art")
    let pieceTwo = Artifact(filename: "", title: "", artist: "", description: "")
    let pieceThree = Artifact(filename: "", title: "", artist: "", description: "")
    
    computerPieces = [pieceOne, pieceTwo, pieceThree]
    
    return computerPieces
}

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

//MARK: Color stuff

let brown : Color = Color(red: (101.0 / 255.0), green: (67.0 / 255.0), blue: (33.0 / 255.0))

func makeBlueShade() -> Color
{
    let redShift = 52
    let greenShift = 145
    let blueShift = 138
    
    let redRange = 2
    let greenRange = 50
    let blueRange = 117
    
    let redPercent =   Double((Int(arc4random())  % redRange  ) + redShift)   / 255.0
    let greenPercent = Double((Int(arc4random())  % greenRange) + greenShift) / 255.0
    let bluePercent =  Double((Int(arc4random())  % blueRange ) + blueShift)  / 255.0
    
    let blueShade = Color(red: redPercent, green: greenPercent, blue: bluePercent)
    
    return blueShade
}

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

//startMethod
func createPolyPath(at position: CGPoint, radius: Double, lineCount: Int) -> Path
{
    var path = Path()
    
    path.move(to: CGPoint(x: position.x, y: position.y + radius))
    
    for lineNum in 0 ..< lineCount
    {
        let angle: Double = (Double)(lineNum) * ((Double.pi * 2.0) / (Double)(lineCount))
        
        let xRotation = radius * sin(angle) + position.x
        let yRotation = radius * cos(angle) + position.y
        
        path.addLine(to: CGPoint(x: xRotation, y: yRotation))
    }
    
    path.closeSubpath()
    
    return path
}
//endMethod
