//
//  DataCell.swift
//  omdbApiSEARCH
//
//  Created by Iva Cicarevic on 2/21/19.
//  Copyright © 2019 Iva Cicarevic. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imdbID: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
