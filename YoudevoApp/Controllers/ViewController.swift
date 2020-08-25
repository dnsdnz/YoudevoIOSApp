//
//  ViewController.swift
//  YoudevoApp
//
//  Created by Deniz MacBook Air on 4.07.2020.
//  Copyright © 2020 Deniz Cakmak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var semaphore = DispatchSemaphore (value: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
           func postData(){
            
            
            let parameters = "{\n    \"title\": \"deneme 9 \",\n    \"category\": \"deneme 9\",\n    \"content\": \"deneme 9\",\n    \"pic_name\": \"/Users/macbookair/Desktop/photo/DSCN0343.png\"\n}"
            let postData = parameters.data(using: .utf8)

            var request = URLRequest(url: URL(string: "http://www.haberler.youdevo.com/api/insert.php")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            request.httpMethod = "POST"
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
            

    func getData(){
              

        var request = URLRequest(url: URL(string: "http://www.haberler.youdevo.com/api/read.php")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

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
       
    
    func putData(){
        
       let parameters = "{\n    \"news_id\":80,\n    \"title\":\"update test\"\n}"
       let postData = parameters.data(using: .utf8)

       var request = URLRequest(url: URL(string: "http://www.haberler.youdevo.com/api/update.php")!,timeoutInterval: Double.infinity)
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")

       request.httpMethod = "PUT"
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
    
   
    func deleteData(){
        
               
             let parameters = "{\n    \"news_id\":33\n}"
             let postData = parameters.data(using: .utf8)

             var request = URLRequest(url: URL(string: "http://www.haberler.youdevo.com/api/delete.php")!,timeoutInterval: Double.infinity)
             request.addValue("application/json", forHTTPHeaderField: "Content-Type")

             request.httpMethod = "DELETE"
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
