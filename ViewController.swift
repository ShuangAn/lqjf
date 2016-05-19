//
//  ViewController.swift
//  lqjf
//
//  Created by 20131105787 on 16/5/9.
//  Copyright © 2016年 20131105787. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //倒计时
    var time : NSTimer!
    var _tame:Int = 1800
    var stop : NSTimer!
    @IBOutlet weak var timel: UILabel!
    //实现加分按钮
    @IBOutlet var jdf: UILabel!
    
    @IBOutlet var ydf: UILabel!
    var x:Int = 0
    var l:Int = 0
    @IBAction func ydjf(sender: UIButton) {
        x++
        ydf.text="\(x)"
    }
    @IBAction func ydjfer(sender: UIButton) {
        x=x+2
        ydf.text="\(x)"
    }
    @IBAction func ydjfsan(sender: UIButton) {
        x=x+3
        ydf.text="\(x)"
    }
    //倒计时方法
    @IBAction func star(sender: AnyObject) {
        time = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector: Selector("tickDown"),userInfo: nil,repeats: true)
    }
    
    @IBAction func stop(sender: AnyObject) {
        time.invalidate()
    }
    func tickDown()
    {
        _tame -= 1
        let sec = _tame%60
        let min = _tame/60
        timel.text = String(min)+":"+String(sec)
        if(_tame == 0) {
            time.invalidate()
        }
    }
    

  
   
    
    @IBAction func jdjf(sender: UIButton) {
        
        l++
        //jdf.text="\(l)"
    }
    @IBAction func jdjfer(sender: UIButton) {
        l=l+2
        jdf.text="\(l)"
    }
    
    @IBAction func jdjfsan(sender: UIButton) {
        l=l+3
        jdf.text="\(l)"

    }
    
    @IBAction func qingkong(sender: UIButton) {
        
        ydf.text="\(0)"
        jdf.text="\(0)"
        
    }
    
    //判断按钮，选择加分
    
    
    
    //1.点击队伍按钮要能获得球队数据2如果点击加一分按钮就应该记录是谁犯规，并记录犯规次数，罚下时做提醒
    //3.最后通过加分按钮的响应按下次数来统计本场得分的综合数据
    //4.按下按钮值应该直接存入数据库，而显示的分的页面是查询数据库之后得到的得分
    var db:SQLiteDB!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists tt_user(uid integer primary key,jdf varchar(20),ydf varchar(20))")
        //如果有数据则加载
        //initUser()
    }
    
    //点击保存
    //保存1，第二次保存2  比分数据变成3  应该存入2   掉用数据库最后一条记录用当前比分减去最后一条记录在存入
   // @IBAction func saveClicked(sender: AnyObject) {
   //     saveUser()
   // }
    
    @IBAction func bc(sender: AnyObject) {
        initUser()
        //saveUser()
    }
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from tt_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            jdf.text=user["jdf"] as? String
            //ydf.text=user["ydf"] as? String
            //txtUname.text = user["uname"] as? String
            //txtMobile.text = user["mobile"] as? String
        }
        print(data)
    }
    
    //保存数据到SQLite
    func saveUser() {
        //甲乙两队得分数据变量
        //let jdf = self.jdf.text!
        //let ydf = self.ydf.text!
        //jiad++
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into tt_user(jdf) values('\(1)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

