//
//  NewsArticleWebView.swift
//  NewsApp
//
//  Created by 60067670 on 2022/02/06.
//

import SwiftUI

struct NewsArticleWebView: View {
	var newsUrl: String
	
    var body: some View {
        SwiftUIWebView(urlString: newsUrl)
			.padding(.top, 20)
    }
}
