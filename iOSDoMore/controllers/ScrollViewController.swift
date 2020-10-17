//
//  ScrollViewController.swift
//  iOSDoMore
//
//  Created by KHURSHIDBEK on 2020/10/17.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }


    // MARK: - Methods
    
    func initViews(){
        addNavigationBar()
        
    }
    
    func addNavigationBar(){

        let back = UIImage(named:"ic_back")
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: back, style: .plain,
                            target: self, action: #selector(backTapped))
        
        title = "Scroll View"
    }
    
    // MARK: - Actions
    
    @objc func backTapped(){
        navigationController?.popViewController(animated: true)
    }

}
