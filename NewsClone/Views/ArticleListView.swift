//
//  ArticleListView.swift
//  NewsClone
//
//  Created by 백승규 on 7/21/24.
//

import SwiftUI

struct ArticleListView: View {
    let articles: [Article]
    var body: some View {
        List {
            ForEach(articles) {article in
                ArticleRowView(article: article)
            }
//           listRowInsets 는 이제 각 요소들 마다 위치
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
//            listRowSeparator 반복될때 스타일, hidden으로 하면 선 지워짐
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ArticleListView(articles: Article.previewData)
}
