//
//  ViewController.swift
//  switchChange
//
//  Created by Mio Harada on 2020/12/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    var cellContents: Array = ["1つ目","2つ目","3つ目","4つ目","5つ目"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView()
        
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.label.text = cellContents[indexPath.row]
        //タグの値にindexPath.rowを入れる
        cell.uiSwitch.tag = indexPath.row
        //スイッチが押されたときの動作
        cell.uiSwitch.addTarget(self, action: #selector(fundlSwitch(_:)), for: UIControl.Event.valueChanged)
        
        return cell
    }
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)が選ばれました！")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //MARK:- *****
    
    @objc func fundlSwitch(_ sender: UISwitch) {
        print(sender.tag)
        print(sender.isOn)
    }
}

