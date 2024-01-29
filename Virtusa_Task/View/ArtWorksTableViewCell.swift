//
//  ArtWorksTableViewCell.swift
//  Virtusa_Task
//
//  Created by Apple on 29/01/24.
//

import UIKit

class ArtWorksTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Bind ArtWork Details
    func bindArtworksDetails(data: Data)  {
        self.titleLabel.text = "Title: \(data.title ?? "")"
        self.artistLabel.text = "Artist Name: \(data.artist_display ?? "")"
        self.placeLabel.text = "Country: \(data.place_of_origin ?? "")"
        self.descriptionLabel.text = "Description: \(data.description?.htmlToString ?? "N/A")"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
