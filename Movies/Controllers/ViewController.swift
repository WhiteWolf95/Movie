//
//  ViewController.swift
//  Movies
//
//  Created by Michael Hughes on 1/29/18.
//  Copyright © 2018 Michael Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txfSearch: UITextField!
    @IBOutlet weak var constTxfSearchY: NSLayoutConstraint!
    let apiManager = ApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txfSearch.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    @IBAction func ConfirmSearch(_ sender: UIButton) {
        
        if !(txfSearch.text?.isEmpty)! {
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.MOVIEW_COLLECTION_CONTROLLER) as? MoviesCollectionController
            detailVC?.name = txfSearch.text!
            self.navigationController?.pushViewController(detailVC!, animated: true)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc
    private func keyboardWillShow(){
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.constTxfSearchY.constant = -30
            self.view.layoutIfNeeded()
        })
    }
    
    @objc
    private func keyboardWillHide(){
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.constTxfSearchY.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

