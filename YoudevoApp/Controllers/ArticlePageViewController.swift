//
//  ArticlePageViewController.swift
//  YoudevoApp
//
//  Created by Deniz MacBook Air on 25.08.2020.
//  Copyright © 2020 Deniz Cakmak. All rights reserved.
//

import UIKit

class ArticlePageViewController: UIViewController {

    var articles = [ArticleItem]()
    var semaphore = DispatchSemaphore (value: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let article1 = ArticleItem(image: #imageLiteral(resourceName: "Sign In with Apple"), caption: "TurkishKit Özel Etkinliği", title: "Her Kız Kodlayabilir")
        let article2 = ArticleItem(image: #imageLiteral(resourceName: "Sign In with Apple"), caption: "TurkishKit Blog Yazısı", title: "Sign in with Apple")
        let article3 = ArticleItem(image: #imageLiteral(resourceName: "Dub Dub '19 Etkinliği"), caption: "TurkishKit Özel Etkinliği", title: "WWDC19 Özel Etkinliği")
            
        articles = [article1, article2, article3]
    }
    
    
    func getDataWithId(){
       
     let parameters = "{\n    \"news_id\":33\n}"
     let postData = parameters.data(using: .utf8)

     var request = URLRequest(url: URL(string: "http://www.haberler.youdevo.com/api/read.php?news_id=80")!,timeoutInterval: Double.infinity)
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")

     request.httpMethod = "GET"
     request.httpBody = postData

     let task = URLSession.shared.dataTask(with: request) { data, response, error in
       guard let data = data else {
         print(String(describing: error))
         return
       }
       print(String(data: data, encoding: .utf8)!)
      self.semaphore.signal()
     }

     task.resume()
     semaphore.wait()


    }

}

extension ArticlePageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let article = articles[indexPath.row]
           
           if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCollectionViewCell {
                           
               cell.imageView.image = article.image
               cell.captionLabel.text = article.caption
               cell.titleLabel.text = article.title
               return cell
               
           } else {
               return UICollectionViewCell()
           }
    }
    
}
    extension ArticlePageViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width = self.view.frame.width - 16.0 * 2
            let height: CGFloat = 234.0
            
            return CGSize(width: width, height: height)
        }
    }


