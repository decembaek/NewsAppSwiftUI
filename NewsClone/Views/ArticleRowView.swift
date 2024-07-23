//
//  ArticleRowView.swift
//  NewsClone
//
//  Created by 백승규 on 7/21/24.
//
// 강의 지점
// https://www.youtube.com/watch?v=LRnbFjq0bTM 34:59


import SwiftUI

struct ArticleRowView: View {
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            AsyncImage(url: article.imageURL){
                phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image.resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                case .failure:
                    HStack {
                        Spacer()
                        Image(systemName:"photo").imageScale(.large)
                        Spacer()
                    }
                    
                    
                @unknown default:
                    EmptyView()
                                    
                }
            }
            .frame(minHeight: 200, maxHeight: 300)
            .background(Color.gray.opacity(0.3))
            .clipped()
            
            VStack(alignment: .leading, spacing: 8,content: {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(3)
                Text(article.descriptionText)
                    .font(.subheadline)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                HStack {
                    Text(article.captionText)
                        .lineLimit(1)
                        .foregroundColor(.secondary)
                        .font(.caption)
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "bookmark")
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .buttonStyle(.bordered)
                }
            })
            .padding([.horizontal, .bottom])
            
        }
    }
}

#Preview {
    NavigationView {
        List {
            ArticleRowView(article: .previewData[0]).listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
    }
    
}
