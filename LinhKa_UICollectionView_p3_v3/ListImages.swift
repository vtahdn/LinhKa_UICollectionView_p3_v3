//
//  ListImages.swift
//  UIScrollView_p4_NetScrollView_v3
//
//  Created by macbook pro  on 9/1/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class ListImages: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set data to this cell
        titleLabel.text = item.title
        contentTextView.text = item.content
        photoImageView.image = UIImage(named: item.images[0] + ".jpg")
        
        // Zoom photos
        photoImageView.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg))
        photoImageView.addGestureRecognizer(tap)
    }
    
    func tapImg() {
        push(0)
    }
    
    func push(index: Int) {
        
        // Initial a view by an ID
        let view = self.storyboard?.instantiateViewControllerWithIdentifier("ScrollView") as? ScrollView
        
        // Set images
        view?.images = item.images
        
        // Set a current page by an index
        view?.currentPage = index
        
        // Go to the view.
        self.navigationController?.pushViewController(view!, animated: true)
        
    }
    
    // The number of photos
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.images.count
    }
    
    // Add images to the cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellItem
        // False = add images
        cell.addSubviews(false)
        cell.imageView.image = UIImage(named: item.images[indexPath.item] + ".jpg")
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        push(indexPath.item)
    }
    
    
    
    
    
    
    
    
    
    
    
}
