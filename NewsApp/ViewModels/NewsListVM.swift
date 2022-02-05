//
//  NewsListVM.swift
//  NewsApp
//
//  Created by 60067670 on 2022/02/05.
//

import Foundation
import SwiftUI

// 이 뷰모델은 클래스로 한다. data를 다운로드 받으면, data를 publish한다. 그리고 이건 subscribe 된다.
class NewsListVM: ObservableObject {
	@Published var news = [NewsViewModel]()
	@Published var imageData = [String: Data]() // image도 받아오는 거여서.
	
	func load() {
		getNews()
	}
	
	private func getNews() {
		let networkManager = NetworkManager()
		networkManager.getNews { (newsArticles) in
			guard let news = newsArticles else { return }
			
			let newsVM = news.map(NewsViewModel.init)
			self.getImages(for: newsVM)
			DispatchQueue.main.async {
				self.news = newsVM
			}
		}
	}
	
	private func getImages(for news: [NewsViewModel]) {
		let nm = NetworkManager()
		news.forEach { n in
			guard !n.urlToImage.isEmpty else { return }
			
			nm.getImage(urlString: n.urlToImage) { (data) in
				guard let data = data else { return }
				
				DispatchQueue.main.async { // 다운로드 될동안 안보여서 메인큐.
					self.imageData[n.urlToImage] = data
				}
			}
		}
	}
}
