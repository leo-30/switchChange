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
        
        // dataSourceメソッドとdelegateメソッドはこのファイルに書くと宣言
        table.dataSource = self
        table.delegate = self
        
        // 余分なセルを描画しないようにする
        table.tableFooterView = UIView()
        
        // 使うxibファイルを指定
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    // セルの個数を配列の個数に設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContents.count
    }
    
    // セルの設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        // セルのラベルに配列の中身を順番に表示
        cell.label.text = cellContents[indexPath.row]
        // スイッチのタグにindexPath.rowの値を入れる
        cell.uiSwitch.tag = indexPath.row
        // スイッチが押されたときの動作
        cell.uiSwitch.addTarget(self, action: #selector(changeSwitch(_:)), for: UIControl.Event.valueChanged)
        
        return cell
    }
    
    // セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番目のセルが選ばれた")
    }
    
    // セルの幅を80に設定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc func changeSwitch(_ sender: UISwitch) {
        /*
         sender.tagにはスイッチのセルの位置が入る(Int)
         sender.isOnにはスイッチのon/off情報が入る(Bool)
         下のprint文はセル内のラベルの内容とスイッチのTrue/False
         */
        print(cellContents[sender.tag] + "が\(sender.isOn)になった")
    }
}
