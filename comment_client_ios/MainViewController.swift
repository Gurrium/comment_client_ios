//
//  ViewController.swift
//  comment_client_ios
//
//  Created by Taira Kaneko on 2017/09/21.
//  Copyright © 2017 Taira Kaneko. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        commentTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func pushedSendButton(_ sender: Any) {
        if let name = nameTextField.text {
            if let comment = commentTextField.text {
                let params = ["comment": ["name": name, "comment": comment]]
                
                commentTextField.text = ""
                
                Alamofire.request("http://localhost:3000/comments.json", method: .post, parameters: params).responseJSON { response in
                    print(String(describing: response.request))  // original URL request
                    print(String(describing: response.response)) // HTTP URL response
                    print(String(describing: response.data) )    // server data
                    print(response.result)   // result of response serialization
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

