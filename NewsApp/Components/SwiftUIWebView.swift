//
//  SwiftUIWebView.swift
//  NewsApp
//
//  Created by 60067670 on 2022/02/06.
//

import Foundation
import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
	var urlString: String
	
	func makeUIView(context: Context) -> WKWebView {
		guard let url = URL(string: urlString) else {
			return WKWebView()
		}
		
		let request = URLRequest(url: url)
		let webview = WKWebView()
		webview.load(request)
		return webview
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
	}
}
