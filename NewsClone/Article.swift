//
//  Article.swift
//  NewsClone
//
//  Created by 백승규 on 7/21/24.
//

import Foundation

//RelativeDateTimeFormatter : iOS, macOS 에서 사용되는 클래스
// 날짜와 시간을 현재 시간과의 상대적인 표현으로 변환해줌
// fileprivate 키워드는 이 변수가 같은 파일 내에서만 접근 가능함을 의미함
fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article {
    let source: Source
    
    let title: String
    let url : String
    let publishedAt: Date
    
    let author: String?
    let description: String?
    let urlToImage: String?
    
    var authorText: String {
        author ?? ""
    }
    
    var descriptionText: String {
        description  ?? ""
    }
    
    var captionText: String {
        "\(source.name) ﹒ \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
    
//    Url 을 받아서 URL 객체로 변경
//    !문법 같은 경우 강제 언래핑, 유효한 문자열임을 확실할 수 있을때 사용
    var articleURL: URL {
        URL(string: url)!
    }
    
    
//    guard let 은 nil 상태인지 확인
//    guard let 은 nil 인 경우 else 문을 실행함
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {return nil}
        return URL(string: urlToImage)
    }
}

// extension은 기존 클래스, 구조체, 열거형, 프로토콜 타입에 새로운 기능을 추가하는 강력한 기능
// Codable : 구조체를 Codable로 확장하여, Json 인코딩 및 디코딩이 가능하게 함. Encldable, Decodable 프로토콜의 조합
// Equatable : Equatable로 확장하여 인스턴스를 비교할 수 있게 함. 이는 '==' 연산자를 사용하여 인스턴스를 비교할때 사용
// Identifiable : Identifiable로 확장하여, 고유 식별자를 제공할 수 있게 함. 여기서는 'url'을 고유 식별자로 사용
extension Article: Codable {}
extension Article: Equatable {}
extension Article: Identifiable {
    var id: String {url}
}

extension Article {
    static var previewData: [Article]{
        let previewDataURL = Bundle.main.url(forResource: "news",withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from:data)
        return apiResponse.articles ?? []
    }
}

struct Source {
    let name: String
}

extension Source: Codable {}
extension Source: Equatable {}


