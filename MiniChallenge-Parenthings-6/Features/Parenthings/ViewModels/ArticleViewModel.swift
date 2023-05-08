//
//  ArticleViewModel.swift
//  MiniChallenge-Parenthings-6
//
//  Created by Rizki Samudra on 05/05/23.
//

import Foundation
import CoreData
import SwiftUI

class ArticleViewModel: ObservableObject {
    private let persistenceController = PersistenceController.shared
    
    typealias ArticleEntity = ArticleE
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isError: Bool = false
    @Published var articles: [ArticleModel] = []
    @Published var articlesCD: [ArticleEntity] = []
  
    init() {
        getArticle()
    }
    
    func getArticle(){
//        deleteArticle()
        loadArticles()
        if(articlesCD.count > 0){
            articles = []
            for a in articlesCD {
                articles.append(ArticleModel().reformat(articlesCD: a))
            }
            
            print("Articles: \(articles.count)")
            return
        }
        else{
            print("empty coredata")
        }
        isLoading = true
        errorMessage = nil
        isError = false
        do {
            articles = try JsonFileOpener().openArticleFile()
            addArticle(articles: articles)
        }catch{
            errorMessage = error.localizedDescription
            print(errorMessage ?? "")
        }
        isLoading = false
        isError = errorMessage != nil
    }
    
    func loadArticles() {
        
        // Request objects that match our model
        let request = NSFetchRequest<ArticleEntity>(entityName: "ArticleE")
        
        // SORT RULES:
        // Priority or basic sort mean sort by a special attribute in CoreData Item.
        // That allow us to save changes in order by user.
        //        let sort = NSSortDescriptor(key: "order", ascending: true)
        //        let fallbackSort = NSSortDescriptor(key: " ", ascending: false)
        //
        //        // Applying sorting
        //        request.sortDescriptors = [sort, fallbackSort]
        
        do {
            // Try to load the result into the monitored array
            try articlesCD = persistenceController.container.viewContext.fetch(request)
        } catch {
            // If it doesn't work
            print("Error getting data. \(error.localizedDescription)")
        }
    }
    
    func deleteArticle() {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ArticleE.fetchRequest()
        
        do {
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            _ = try persistenceController.container.viewContext.execute(batchDeleteRequest)
            
        } catch {
            // If it doesn't work
            print("Error getting data. \(error.localizedDescription)")
        }
    }
    
    
    private func addArticle(articles: [ArticleModel]){
        for a in articles {
           
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleE")
            let predicate = NSPredicate(format: "id == %ld", Int16(a.id))
            request.predicate = predicate
            request.fetchLimit = 1
            
            do{
              
                let count = try persistenceController.container.viewContext.fetch(request).count
                if(count == 0){
                    // no matching object
//                    print("notFound")
                    withAnimation {
                        let article = ArticleE(context: persistenceController.container.viewContext)
                        article.tag = a.tag
                        article.author = a.author
                        article.image = a.image
                        article.article = a.article
                        article.source = a.source
                        article.date = a.date
                        article.title = a.title
                        article.id =  Int16(a.id)
                        
                        saveContext()
                    }
                }
                else{
                    print("Found")
                    // at least one matching object exists
                }
            }
            catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
            
        }
        
    }
    private func saveContext() {
        if persistenceController.container.viewContext.hasChanges {
            do {
                // Try to save all data in the currrent container
                try persistenceController.container.viewContext.save()
                
            } catch let error {
                // If it doesn't work
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
