//
//  ListItemView.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class ListItemView: UIView {

    @IBOutlet private var container: UIStackView!
    @IBOutlet private var textContentContainer: UIStackView!
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    
    private var edgeInsets: UIEdgeInsets = .pairs(vertical: 8, horizontal: 12)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initialize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ListItemView", owner: self, options: nil)
        addSubview(container)
        container.leftAnchor.constraint(equalTo: leftAnchor, constant: edgeInsets.left).isActive = true
        container.topAnchor.constraint(equalTo: topAnchor, constant: edgeInsets.top).isActive = true
        container.rightAnchor.constraint(equalTo: rightAnchor, constant: -edgeInsets.right).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edgeInsets.bottom).isActive = true
        updateConstraintsIfNeeded()
    }
    
    private func initialize() {
        backgroundColor = .background
        container.spacing = 8
        textContentContainer.spacing = 4
        imageView.contentMode = .scaleAspectFit
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    func customize(for item: ListItem) {
        imageView.image = item.icon?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = item.status.color
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        layoutIfNeeded()
    }
}
