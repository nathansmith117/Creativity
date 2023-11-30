//
//  Artifact.swift
//  Creativity
//
//  Created by Smith, Nathanael on 11/30/23.
//

import Foundation

struct Artifact : Identifiable
{
    let id = UUID()
    let filename : String
    let title : String
    let artist : String
    let description : String
}
