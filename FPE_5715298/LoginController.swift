//
//  LoginController.swift
//  FPE_5715298
//
//  Created by never on 5/9/18.
//  Copyright © 2018 CS3432. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginController: UIViewController {

    
    @IBOutlet weak var tf_username: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    let url = "http://auspark4.cloudapp.net:888/ios/GetGradeListBySemester"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getGrade(user: String,pass:String){
        
        let parameters: Parameters=[
            "username":user
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    print("in")
                    let js = JSON(result)
                    
                    
                    
                }else{
                    print("out")
                }
        }
        
    }
    
    //switching the screen
    //                        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewcontroller") as! ProfileViewController
    //                        self.navigationController?.pushViewController(profileViewController, animated: true)
    //
    //                        self.dismiss(animated: false, completion: nil)
    
    @IBAction func onClickLogIn(_ sender: Any) {
        let username = tf_username.text
        let password = tf_password.text

        if (username==""||password==""){
            print("empty")
        }else{
            
            self.getGrade(user: username!, pass: password!)
            
//            let gradeListViewController = self.storyboard?.instantiateViewController(withIdentifier: "GradeListController") as! GradeListController
//
//            self.navigationController?.pushViewController(gradeListViewController, animated: true)
//
//            self.dismiss(animated: false, completion: nil)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
