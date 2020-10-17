//
//  HomeViewController.swift
//  iOSDoMore
//
//  Created by KHURSHIDBEK on 2020/10/17.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    var items : Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    // MARK: - Methods
    
    func initViews(){
        addNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        items.append(Item(title: "PDP", image: "ic_online"))
        items.append(Item(title: "PDP", image: "ic_online"))
        items.append(Item(title: "PDP", image: "ic_online"))
        items.append(Item(title: "PDP", image: "ic_online"))
        items.append(Item(title: "PDP", image: "ic_online"))
        items.append(Item(title: "PDP", image: "ic_online"))
        items.append(Item(title: "PDP", image: "ic_online"))
    }
    
    
    func addNavigationBar(){

        let scroll = UIImage(named:"ic_scroll")
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: scroll, style: .plain,
                        target: self, action: #selector(scrollTapped))
        
        title = "Collection View"
    }
    
    func callScrollController(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Actions
    
    @objc func scrollTapped(){
        callScrollController()
    }
    
    // MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        return cell
    }
}
