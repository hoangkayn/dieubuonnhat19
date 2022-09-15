//
//  Game_Play_ViewController.swift
//  App_Dua_Thu
//
//  Created by Nguyễn Khánh Hoàng on 02/09/2022.
//
import UIKit
class Game_Play_ViewController:
    UIViewController {
    @IBOutlet weak var finish: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img_robot: UIImageView!
    @IBOutlet weak var img_girl: UIImageView!
    @IBOutlet weak var knight: UIImageView!
    @IBOutlet weak var cat: UIImageView!
    @IBOutlet weak var lbl_number_start: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var background2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        finish.alpha = 0
        background.frame.origin.x = 0
        background.frame.origin.y = 0
        background.frame.size.width = view.frame.size.width
        background.frame.size.height = view.frame.size.height
        
        background2.frame.origin.x =  view.frame.size.width
        background2.frame.origin.y = 0
        background2.frame.size.width = view.frame.size.width
        background2.frame.size.height = view.frame.size.height
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        lbl.alpha = 0
        self.tabBarController?.tabBar.isHidden = true
        Socket2022.shareInstance.connectSocketServer()
       socket.on("START") { [self](data,ack)  in
            let number = data[0] as! Int
            self.lbl_number_start.text = String(number)
           
            if( number == 0 ){
                self.lbl_number_start.text = "GO!!!"
            }else if(number == -1){
                lbl_number_start.isHidden = true
            }
       
       }
    
        let timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.update), userInfo: Timer.self, repeats: true)
        let timerr = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.updatee), userInfo: updatee(timerr:).self, repeats: true)
        }
    @objc func update(timer: Timer){
        socket.on("runNumber") { [self] (data,ack) in
            
            let runNumber = data[0] as! Int
            self.img_robot.image = UIImage(named: "robot/Run (\(runNumber))")
            self.img_girl.image = UIImage(named: "adventurer girl/Run (\(runNumber))")
            self.knight.image = UIImage(named: "knight/Run (\(runNumber))")
            self.cat.image = UIImage(named: "cat/Run (\(runNumber))")
            
        }
        socket.on("moveNumber1") { [self] (data,ack) in
            let moveNumber1 = data[0] as! Int
            self.img_robot.frame.origin.x = CGFloat(moveNumber1)
            
        }
        socket.on("moveNumber2") { [self] (data,ack) in
            let moveNumber2 = data[0] as! Int
            self.img_girl.frame.origin.x = CGFloat(moveNumber2)
            
        }
        socket.on("moveNumber3") { [self] (data,ack) in
            let moveNumber3 = data[0] as! Int
            self.knight.frame.origin.x = CGFloat(moveNumber3)
            
        }
        socket.on("moveNumber4") { [self] (data,ack) in
            let moveNumber4 = data[0] as! Int
            self.cat.frame.origin.x = CGFloat(moveNumber4)
            
        }
        if( img_girl.frame.origin.x >= CGFloat(780) ||
            img_robot.frame.origin.x >= CGFloat(780) ||
        knight.frame.origin.x >= CGFloat(780) ||
            cat.frame.origin.x >= CGFloat(780)){
            UIView.animate(withDuration: 3) { [self] in
                lbl.alpha = 1
                timer.invalidate()
                socket.on("winOrLose") { [self] (data,ack) in
                    let winorlose = data[0] as! String
                    lbl.text = winorlose
                }
            } completion: { [self](done) in
                timer.invalidate()
            lbl.alpha = 0
                img_girl.frame.origin.x = CGFloat(36)
                img_robot.frame.origin.x = CGFloat(36)
                knight.frame.origin.x = CGFloat(36)
                cat.frame.origin.x = CGFloat(36)
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let choose_animals_VC = sb.instantiateViewController(identifier: "CHOOSE_ANIMALS") as! Choose_animals_ViewController
                self.navigationController?.pushViewController(choose_animals_VC, animated: false)
            }

           
           
        }
}
    @objc func updatee(timerr:Timer){
    if(img_robot.frame.origin.x > CGFloat(37) ||
       img_girl.frame.origin.x > CGFloat(37) ||
       knight.frame.origin.x > CGFloat(37) ||
    cat.frame.origin.x > CGFloat(37)) {
        background.frame.origin.x -= 4
        background2.frame.origin.x -= 4
        if(background2.frame.origin.x == 0){
            background.frame.origin.x = view.frame.size.width
        }
        else if(background.frame.origin.x == 0){
            background2.frame.origin.x = view.frame.size.width
        }
}
     if(img_robot.frame.origin.x > CGFloat(650) ||
       img_girl.frame.origin.x > CGFloat(650) ||
       knight.frame.origin.x > CGFloat(650) ||
            cat.frame.origin.x > CGFloat(650)) {
        finish.alpha = 1
        timerr.invalidate()
    }
}
    }
   
