//
//  ViewController.swift
//  DogAPI
//
//  Created by Dhaval Nimavat on 06/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeImage(_ sender: Any) {
        dogs()
    }
    
    
    func dogs()
    {
        //Define URL for json
        let myURL = URL(string: "https://dog.ceo/api/breeds/image/random")
        //Convert URL into URLRequest
        var myRequest = URLRequest(url: myURL!)
        //Define the method of request
        myRequest.httpMethod = "GET"
        
        //Task Create
        let task = try! URLSession.shared.dataTask(with: myRequest)
        { (mydata,URLResponse,error) in
            let jsonData = try! JSONSerialization.jsonObject(with: mydata!) as! [String:Any]
            print("WebSite Data",jsonData)
            let messsagedata = jsonData["message"] as! String
            print("Dog URL",messsagedata)
            let statusSTring = jsonData["status"] as! String
            //Set image to imageview
            DispatchQueue.main.async {
                //URL - img DAta -- imageview
                let dogurl = URL(string: messsagedata)
                let imgData = try! Data(contentsOf: dogurl!)
                self.myImage.image = UIImage(data: imgData)
            }
        }
        print("All Set")
        //Task Execute
        task.resume()
    }
    
}

