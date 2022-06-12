//
//  PopularNewsTableViewCell.swift
//  CitrixAssignment
//
//  Created by Stanly Johnson on 10/06/22.
//

import UIKit

class PopularNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: NewsViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureUI(at index: Int) {
        let popularNews = viewModel?.popularNewsDetails(at: index)
        titleLabel.text = popularNews?.title
        descLabel.text = popularNews?.abstract
        dateLabel.text = popularNews?.published_date
        authorLabel.text = popularNews?.byline
        if let media = popularNews?.media {
            if media.count > 0 {
        if let url = URL(string: media[0].mediaMetadata?[0].url ?? "") {
            let data = try? Data(contentsOf: url)
            if let imageData = data {
                let image = UIImage(data: imageData)
                newsImageView.image = image
            }
        }
            }
        }
    }
    
}
