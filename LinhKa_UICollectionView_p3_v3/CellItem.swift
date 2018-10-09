//
//  CellItem.swift
//  LinhKa_UICollectionCell_p2_v2
//
//  Created by macbook on 10/8/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class CellItem: UICollectionViewCell {
    
    var nameLabel: UILabel!
    var imageView: UIImageView!
    var codeLabel: UILabel!
    var codeLabelHeight: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Add items to Cell
    func addSubviews(all: Bool) {
        let cellWidth = self.layer.bounds.width
        // Add imageView
        if imageView == nil {
            imageView = UIImageView(frame: CGRectMake(0, 0, cellWidth, cellWidth))
            // Set border: TintColor: default blue
            imageView.layer.borderColor = tintColor.CGColor
            imageView.contentMode = .ScaleAspectFit
            contentView.addSubview(imageView)
        }
        
        if all {
            // Add title
            if nameLabel == nil {
                nameLabel = UILabel(frame: CGRectMake(10, cellWidth, cellWidth, codeLabelHeight))
                nameLabel.textAlignment = .Left
                nameLabel.textColor = UIColor.whiteColor()
                nameLabel.highlightedTextColor = tintColor
                nameLabel.font = UIFont.systemFontOfSize(10)
                nameLabel.numberOfLines = 2
                contentView.addSubview(nameLabel)
            }
            // Add code number
            if codeLabel == nil {
                codeLabel = UILabel(frame: CGRectMake(10, cellWidth + codeLabelHeight, cellWidth, codeLabelHeight))
                codeLabel.textAlignment = .Left
                codeLabel.textColor = UIColor.whiteColor()
                codeLabel.font = UIFont.boldSystemFontOfSize(12)
                contentView.addSubview(codeLabel)
            }
        }
        
    }
    
    override var selected: Bool {
        didSet {
            imageView.layer.borderWidth = selected ? 2 : 0
        }
    }
    
}
