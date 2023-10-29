//
//  TableViewCell.swift
//  Task17
//
//  Created by Nikoloz Gachechiladze on 29.10.23.
//

import UIKit

class TVShowCell: UITableViewCell {
    
    //MARK: Properties
    
     let showName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 23)
        label.textColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpConstraints()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        showName.text = nil
        showImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: Methods
    
    private func addSubviews() {
        contentView.addSubview(showName)
        contentView.addSubview(showImageView)
    }
    
    private func setUpConstraints () {
        NSLayoutConstraint.activate([
            showImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            showImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            showImageView.widthAnchor.constraint(equalToConstant: 40),
            showImageView.heightAnchor.constraint(equalToConstant: 40),
            showName.leadingAnchor.constraint(equalTo: showImageView.trailingAnchor, constant: 16),
            showName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            showName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
