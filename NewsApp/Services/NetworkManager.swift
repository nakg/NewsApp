//
//  NetworkManager.swift
//  NewsApp
//
//  Created by 60067670 on 2022/02/05.
//

import Foundation

class NetworkManager {
	private let baseUrlString = "https://newsapi.org/v2/"
	private let usTopHeadline = "top-headlines?country=us"
	
	func getNews(completion: @escaping (([News]?) -> Void)) {
		let urlString = "\(baseUrlString)\(usTopHeadline)&apikey=\(API.key)"
		
		guard let url = URL(string: urlString) else {
			completion(nil)
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil, let data = data else {
				completion(nil)
				return
			}
			
			let newsRes = try? JSONDecoder().decode(NewsEnvelop.self, from: data)
			newsRes == nil ? completion(nil) : completion(newsRes!.articles)
		}.resume()
	}
	
	func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
		guard let url = URL(string: urlString) else {
			completion(nil)
			return
		}
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil, let data = data else {
				completion(nil)
				return
			}
			completion(data)
		}.resume()
	}
}
