//
//  ImageExtensions.swift
//
//
//  Created by SwiftyLLC on 21/4/24.
//

import SwiftUI

extension Image {
    init(cgImage: CGImage) {
        #if os(iOS)
        self.init(uiImage: UIImage(cgImage: cgImage))
        #elseif os(macOS)
        self.init(nsImage: NSImage(cgImage: cgImage, size: CGSize(width: cgImage.width, height: cgImage.height)))
        #else
        #error("Unsupported Platform")
        #endif
    }
}
