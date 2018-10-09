//
//  HomeViewController.swift
//  LinhKa_Collection_p1_v3
//
//  Created by macbook on 10/6/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        
    }
    
    func initData() -> Void {
        var list = NSDictionary()
        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist") {
            list = NSDictionary(contentsOfFile: path)!
        }
        for value in list.allValues {
            let name = value["title"] as! String
            let content = value["content"] as! String
            let images = value["images"] as! [String]
            let code = value["code"] as! String
            items.append(Item(title: name, content: content, images: images, code: code))
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellItem
        let name = items[indexPath.item].images[0] + ".jpg"
        
        // True = add all items
        cell.addSubviews(true)
        cell.imageView.image = UIImage(named: name)
        cell.nameLabel.text = items[indexPath.item].title
        cell.codeLabel.text = items[indexPath.item].code
        
        return cell
    }
    
    // Go to the ListImage view
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let listView = storyboard?.instantiateViewControllerWithIdentifier("ListImageDetail") as! ListImages
        listView.item = items[indexPath.item]
        navigationController?.pushViewController(listView, animated: true)
    }
    

    
    
    
    
    
    
    
}
