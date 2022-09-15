//
//  Choose_animals_ViewController.swift
//  App_Dua_Thu
//
//  Created by Nguyễn Khánh Hoàng on 29/08/2022.
import UIKit
var socket = Socket2022.shareInstance.getSocketInfo()
class Choose_animals_ViewController: UIViewController {
  
    @IBOutlet weak var left_img: UIButton!
    @IBOutlet weak var img_animals: UIImageView!
    @IBOutlet weak var lock_img: UIButton!
    @IBOutlet weak var number_to_server: UILabel!
    @IBOutlet weak var right_img: UIButton!
    var number = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        img_animals.image = UIImage(named: "avatar_animals/\(number)")
          Socket2022.shareInstance.connectSocketServer()
           socket.on("SERVER SEND NUMBER") { [self] (data,ack)  in
           let  number = (data[0] as! Int)
            number_to_server.text = String(number)
               if(number == 0){
                   number_to_server.isHidden = true
               }
           }
        socket.on("PING") { (data,ack) in
               let sb = UIStoryboard(name: "Main", bundle: nil)
                let game_play_VC = sb.instantiateViewController(identifier: "GAME_PLAY") as! Game_Play_ViewController
                self.navigationController?.pushViewController(game_play_VC, animated: false)
            socket.off("PING")
        }
        }
    @IBAction func left_img(_ sender: Any) {
        if(number == 1){
            number = 5
            img_animals.image = UIImage(named: "avatar_animals/\(number)")
        }else{
            number -= 1
            img_animals.image = UIImage(named: "avatar_animals/\(number)")
        }
    }
    @IBAction func right_img(_ sender: Any) {
        if(number < 5){
            number += 1
            img_animals.image = UIImage(named: "avatar_animals/\(number)")
        }else{
            number = 1
            img_animals.image = UIImage(named: "avatar_animals/\(number)")
        }
    }
    @IBAction func lock_img(_ sender: Any) {
        left_img.isHidden = true
        right_img.isHidden = true
        lock_img.alpha = 0.5
        socket.emit("lockImg","avatar_animals/\(number)")
    }
}
