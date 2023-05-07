//
//  ArticleModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 05/05/23.
//

import Foundation

struct ArticleModel : Codable, Identifiable, Hashable {
    var id : Int = 0
    var title : String = ""
    var author : String = ""
    var tag : String = ""
    var image : String = ""
    var article : String = ""
    var date : String = ""
    var source : String = ""
    
    func sampleData(img: String = "Article1")-> ArticleModel {

        return ArticleModel(id: 0
                            ,title: "Dokter Kandungan"
                            ,author: "Dokter Boyke"
                            ,tag: "#Usiadini"
                            ,image: "Article1"
                            ,article: "Selama pandemi Covid-19, banyak orangtua yang bekerja dari rumah. Karena lebih banyak waktu di rumah, maka pastinya akan selalu bertemu dengan anaknya. Apalagi yang memiliki anak usia dini, selain bekerja, orangtua juga tetap memberikan pendampingan pada anaknya. Hanya saja harus bisa membagi waktu."
                            ,date: "20 Mei 2023"
                            ,source: "www.google.com")
    }
    
    func reformat(articlesCD: ArticleE) -> ArticleModel {
        return ArticleModel(id: Int(articlesCD.id)
                            ,title: articlesCD.title ?? ""
                            ,author: articlesCD.author  ?? ""
                            ,tag: articlesCD.tag  ?? ""
                            ,image: articlesCD.image  ?? ""
                            ,article: articlesCD.article  ?? ""
                            ,date: articlesCD.date  ?? ""
                            ,source: articlesCD.source  ?? "")
    }
}
