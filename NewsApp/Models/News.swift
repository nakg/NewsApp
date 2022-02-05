//
//  News.swift
//  NewsApp
//
//  Created by 60067670 on 2022/02/05.
//

import Foundation

struct News: Decodable {
	let author: String?
	let title: String?
	let description: String?
	let urlToImage: String?
	let url: String?
}

struct NewsEnvelop: Decodable {
	let status: String
	let totalResults: Int
	let articles: [News]
}
