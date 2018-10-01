//
//  ViewController.swift
//  GoogleSign-Swift-Tutorial
//
//  Created by Aman Aggarwal on 30/09/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var btnGoogleSignIn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnGoogleSignIn.addTarget(self, action: #selector(signinUserUsingGoogle(_ :)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func signinUserUsingGoogle(_ sender: UIButton) {
        
        if btnGoogleSignIn.title(for: .normal) == "Sign Out" {
            GIDSignIn.sharedInstance().signOut()
            lblTitle.text = ""
            btnGoogleSignIn.setTitle("Sign In using Google", for: .normal)
        } else {
            GIDSignIn.sharedInstance().delegate = self
            GIDSignIn.sharedInstance().uiDelegate = self
            GIDSignIn.sharedInstance().signIn()
        }
    }

    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print("We have error sign in user == \(error.localizedDescription)")
        } else {
            if let gmailUser = user {
                lblTitle.text = "You are sign in using id \(gmailUser.profile.email!)"
                btnGoogleSignIn.setTitle("Sign Out", for: .normal)
                
            }
        }
    }

}

