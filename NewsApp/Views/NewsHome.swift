//
//  NewsHome.swift
//  NewsApp
//
//  Created by 60067670 on 2022/02/05.
//

import SwiftUI

struct NewsHome: View {
	
	@ObservedObject private var newsListVM = NewsListVM()
	
	init() {
		newsListVM.load()
	}
	
    var body: some View {
		VStack {
			NewsListHeader()
			NewsListView(newsCollection: self.newsListVM.news, imageData: self.newsListVM.imageData)
		}
    }
}

struct NewsHome_Previews: PreviewProvider {
    static var previews: some View {
        NewsHome()
    }
}
