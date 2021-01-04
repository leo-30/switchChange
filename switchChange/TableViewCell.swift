//
//  TableViewCell.swift
//  switchChange
//
//  Created by Mio Harada on 2020/12/31.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var uiSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // switchを最初全てoffにしておく
        uiSwitch.isOn = false
    }
    
    // switchが押された時に呼ばれる
    @IBAction func changeSwitch(_ sender: UISwitch) {
                    if sender.isOn {
                        print("on")
                    } else {
                        print("off")
                    }
    }
}
