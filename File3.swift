//
//  File3.swift
//  lqjf
//
//  Created by 20131105787 on 16/6/21.
//  Copyright © 2016年 20131105787. All rights reserved.
//

import UIKit

class File3: UIViewController {
    
    @IBOutlet weak var jdname: UILabel!
    @IBOutlet weak var ydname: UILabel!
    
    @IBOutlet weak var jfs: UILabel!
    @IBOutlet weak var yfs: UILabel!
    var db:SQLiteDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        //db.execute("create table if not exists tt_user(uid integer primary key,jdf varchar(20),ydf varchar(20))")
        //如果有数据则加载
        initUser()
        initbf()
    }
    
    //点击保存
    //保存1，第二次保存2  比分数据变成3  应该存入2   掉用数据库最后一条记录用当前比分减去最后一条记录在存入
    // @IBAction func saveClicked(sender: AnyObject) {
    //     saveUser()
    // }
    
        //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from xx_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            jdname.text=user["jdxx"] as? String
            ydname.text=user["ydxx"] as? String
            //txtUname.text = user["uname"] as? String
            //txtMobile.text = user["mobile"] as? String
        }
        print(data)
    }
    func initbf() {
        let data = db.query("select * from zf_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            jfs.text=user["jdf"] as? String
            yfs.text=user["ydf"] as? String
            //txtUname.text = user["uname"] as? String
            //txtMobile.text = user["mobile"] as? String
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
