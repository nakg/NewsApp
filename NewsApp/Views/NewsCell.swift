//
//  NewsCell.swift
//  NewsApp
//
//  Created by 60067670 on 2022/02/05.
//

import SwiftUI

struct NewsCell: View {
	
	let news: NewsViewModel
	let image: Image
	
	@State private var isPresented: Bool = false
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			image
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: UIScreen.main.bounds.width - 70, height: 200, alignment: .center)
				.clipped()
				.cornerRadius(20)
				.shadow(color: .black, radius: 5, x: 5, y: 5)
			
			Text(news.author)
				.font(.subheadline)
				.padding(10)
				.foregroundColor(.white)
				.background(Color.gray)
				.cornerRadius(10)
			
			Text(news.title)
				.font(.subheadline)
				.foregroundColor(.black)
			
			Text(news.description)
				.font(.caption)
				.foregroundColor(.black)
		}
    }
}


