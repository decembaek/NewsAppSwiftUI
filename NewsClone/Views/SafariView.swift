//
//  SafariView.swift
//  NewsClone
//
//  Created by 백승규 on 7/23/24.
//

import Foundation
import SwiftUI

import SafariServices


struct SafariView : UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        SFSafariViewController(url: url)

    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
    }
}
