//
//  ListingTableViewCell.swift
//  TradeMe
//
//  Created by Atharva Vaidya on 12/08/2018.
//  Copyright © 2018 Atharva vaidya. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell
{
    let listingImageView: UIImageView = UIImageView()
    let locationNameLabel: UILabel = UILabel()
    let listingNameLabel: UILabel = UILabel()
    let listingDisplayPriceLabel: UILabel = UILabel()
    
    static let identifier: String = String(describing: self)
    private var hasAppliedConstraints: Bool = false
    
    var listing: Listing?
    {
        didSet
        {
            update()
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    init(listing: Listing)
    {
        self.listing = listing
        super.init(style: .default, reuseIdentifier: ListingTableViewCell.identifier)
        setup()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        self.listing = nil
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
    
    func setup()
    {
        setupSubviews()
        update()
    }
    
    func update()
    {
        guard let listing = self.listing else { return }
        listingNameLabel.text = listing.title
        locationNameLabel.text = listing.region
        listingDisplayPriceLabel.text = listing.priceDisplay
    }
    
    func update(image: UIImage)
    {
        hasAppliedConstraints = false
        listingImageView.image = image
        listingImageView.setNeedsDisplay()
    }
    
    func setupSubviews()
    {
        [listingImageView, listingNameLabel, locationNameLabel, listingDisplayPriceLabel].forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
        
        listingNameLabel.textColor = .black
        listingNameLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        listingNameLabel.numberOfLines = 0
        
        locationNameLabel.textColor = UIColor.gray
        locationNameLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        
        listingDisplayPriceLabel.textColor = .black
        listingDisplayPriceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        contentView.addSubview(listingImageView)
        contentView.addSubview(listingNameLabel)
        contentView.addSubview(locationNameLabel)
        contentView.addSubview(listingDisplayPriceLabel)
    }
    
    override func layoutIfNeeded()
    {
        super.layoutIfNeeded()
        
        self.updateConstraints()
    }
    
    override func updateConstraints()
    {
        if hasAppliedConstraints { return }
        
        var contentViewConstraints: [NSLayoutConstraint] = []
        
        contentViewConstraints.append(listingImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor))
        contentViewConstraints.append(listingImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor))
        contentViewConstraints.append(listingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor))
        contentViewConstraints.append(listingImageView.topAnchor.constraint(equalTo: contentView.topAnchor))
        
        contentViewConstraints.append(locationNameLabel.leadingAnchor.constraint(equalTo: listingImageView.trailingAnchor, constant: 2))
        contentViewConstraints.append(locationNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5))
        contentViewConstraints.append(locationNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2))
        
        contentViewConstraints.append(listingNameLabel.leadingAnchor.constraint(equalTo: listingImageView.trailingAnchor, constant: 2))
        contentViewConstraints.append(listingNameLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor, constant: 2))
        contentViewConstraints.append(listingNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -2))
        contentViewConstraints.append(listingNameLabel.bottomAnchor.constraint(equalTo: listingDisplayPriceLabel.topAnchor, constant: -2))
        
        contentViewConstraints.append(listingDisplayPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2))
        contentViewConstraints.append(listingDisplayPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2))
        
        NSLayoutConstraint.activate(contentViewConstraints)
        
        hasAppliedConstraints = true
        
        super.updateConstraints()
    }
}
