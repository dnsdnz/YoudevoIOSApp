//
//  ViewController.swift
//  YoudevoApp
//
//  Created by Deniz MacBook Air on 4.07.2020.
//  Copyright © 2020 Deniz Cakmak. All rights reserved.
//

import UIKit

struct data2 : Decodable {
    let news_id:Int
    let title:String
    let category:String
    let content:String
    let pic_name:String
  
}

class ViewController: UIViewController {

    
    @IBOutlet weak var lblTest: UILabel!
    var testVar = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        func getdata(){
               let url = URL(string: "http://www.haberler.youdevo.com/api/read.php")
               
               URLSession.shared.dataTask(with: url!) { (data, response, error) in
                   do{
                    print(data)
                    
                       if error == nil{
                       
                           let res = try JSONDecoder().decode(data2.self, from: data!)
                               
                               DispatchQueue.main.async {
                                  
                                self.testVar = res.title
                                
                                print(self.testVar)
                                self.lblTest.text = self.testVar
                                
                                  // self.lblName.text = locName
                                   //self.lblDetail.text = locContent
                                  
                               }
                       }
                   }
                   catch{
                       print(error)
                   }
                   }.resume()
           }
       
    }


}

