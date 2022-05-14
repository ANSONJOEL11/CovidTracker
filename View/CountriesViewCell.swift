//
//  CountriesViewCell.swift
//  covidTracker



import UIKit

class CountriesViewCell: UITableViewCell {

    @IBOutlet weak var countryname: UILabel!
    @IBOutlet weak var countryimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
