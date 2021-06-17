//
//  VehicleCell.swift
//  CarfaxTechAssignment
//
//  Created by Michael Veit on 6/16/21.
//

import UIKit

class VehicleCell: UITableViewCell {

    @IBOutlet weak var listingStackView: UIStackView!
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var vehicleInfoStackView: UIStackView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var mileage: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var dealerPhone: UIButton!
    private var dealerPhoneNumber: String = ""
    
    
    public func setData(listingData: Listing) {
        let data = try? Data(contentsOf: URL(string: listingData.images.firstPhoto.medium)!)
        if let imageData = data {
             vehicleImage.image = UIImage(data: imageData)
        } else {
            vehicleImage.image = UIImage(named: "noimage")
        }
        let vehicleTitle = "\(listingData.year) \(listingData.make) \(listingData.model)"
        title.text = vehicleTitle
        price.text = "$\(listingData.currentPrice)"
        mileage.text = "\(listingData.mileage) Mi"
        let vehicleLocation = "\(listingData.dealer.city), \(listingData.dealer.state)"
        location.text = vehicleLocation
        dealerPhoneNumber = listingData.dealer.phone
        dealerPhone.setTitle(listingData.dealer.phone, for: .normal)
    }
    
    @IBAction func dealerPhoneButtonPressed(_ sender: Any) {
        if let url = URL(string: "tel://\(dealerPhoneNumber)") {
            UIApplication.shared.open(url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
