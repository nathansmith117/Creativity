//
//  ArtifactView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 11/30/23.
//

import SwiftUI

struct ArtifactView: View
{
    let artifact : Artifact
    
    var body: some View
    {
        Text(artifact.title)
            .accessibilityLabel("Title of artifact")
            .accessibilityValue(artifact.title)
        Image(artifact.filename)
            .resizable()
            .scaledToFit()
            .accessibilityLabel("Image of \(artifact.title)")
            .accessibilityValue("Image of \(artifact.title)")
        Text(artifact.artist)
            .accessibilityLabel("Artist of artifact")
            .accessibilityValue(artifact.artist)
        Text(artifact.description)
            .accessibilityLabel("Description of artifact")
            .accessibilityValue(artifact.description)
    }
}

#Preview
{
    ArtifactView(artifact: demoArtifact)
}
