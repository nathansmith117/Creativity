//
//  CustomPDFView.swift
//  Creativity
//
//  Created by Smith, Nathanael on 12/8/23.
//

import SwiftUI
import PDFKit

struct CustomPDFView: View
{
    var url: URL
    
    var body: some View
    {
        PDFKitRepresentedView(documentURL: url)
            .accessibilityLabel("PDf of the supplided URL \(url.description)")
            .accessibilityValue("Contents of PDF at URL")
    }
}

struct PDFKitRepresentedView : UIViewRepresentable
{
    let documentURL : URL
    
    init(documentURL : URL)
    {
        self.documentURL = documentURL
    }
    
    func makeUIView(context : Context) -> some UIView
    {
        let pdfView : PDFView = PDFView()
        
        pdfView.document = PDFDocument(url: self.documentURL)
        pdfView.autoScales = true
        pdfView.displayDirection = .vertical
        pdfView.minScaleFactor = 0.5
        pdfView.maxScaleFactor = 5.0
        
        return pdfView
    }
    
    func updateUIView(_ uiView : UIViewType, context : Context) -> Void
    {
        
    }
}

#Preview ("Custom PDF Viewer")
{
    CustomPDFView(url: shadeURL)
}
