//
//  TableViewCell.swift
//  switchChange
//
//  Created by Mio Harada on 2020/12/31.
//

import UIKit

protocol Delegate: class {
    // スイッチがONにされたときに実行されるメソッド
    func didSwitchOn()
    // スイッチがOFFにされたときに実行されるメソッド
    func didSwitchOff()
}

class TableViewCell: UITableViewCell {

    var delegate: Delegate?
    var isOptional: Bool = false

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var uiSwitch: UISwitch!

    @IBAction func didChangeduiSwitch(_ sender: UISwitch) {
        if sender.isOn {
            delegate?.didSwitchOn()
            print("onになった")
        } else {
            delegate?.didSwitchOff()
            print("offになった")
        }
    }

}
