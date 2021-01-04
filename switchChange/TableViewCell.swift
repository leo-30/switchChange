//
//  TableViewCell.swift
//  switchChange
//
//  Created by Mio Harada on 2020/12/31.
//

import UIKit

protocol Delegate: class {
    // スイッチがonにされたときに実行されるメソッド
    func didSwitchOn()
    // スイッチがoffにされたときに実行されるメソッド
    func didSwitchOff()
}

class TableViewCell: UITableViewCell {

    var delegate: Delegate?

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var uiSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // switchを最初全てoffにしておく
        uiSwitch.isOn = false
    }
    
    @IBAction func changeSwitch(_ sender: UISwitch) {
        if sender.isOn {
            delegate?.didSwitchOn()
        } else {
            delegate?.didSwitchOff()
        }
    }
}
