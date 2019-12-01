//
//  ViewController.swift
//  Calc
//
//  Created by 菊谷将 on 2019/11/21.
//  Copyright © 2019 Masaru Kikutani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbView: UILabel!
    // オペランド1
    var ope01 = 0
    
    // 符号キーの保持
    var hugou = 1
    
    // 符号キー押したか判断のためのフラグ
    var flg = true
    
    // 数字キー押下
    @IBAction func pushNumber(_ sender: UIButton) {
        
        if lbView.text != "0" && !flg {
            lbView.text! = "\(lbView.text!)\(sender.tag)"
        } else {
            lbView.text = "\(sender.tag)"
            
            flg = false
        }
        
        
    }
    
    // 計算処理
    @IBAction func hugouBtn(_ sender: UIButton) {
        /*
         1 +
         2 -
         3 *
         4 /
         9 =
         */
        
        // 符号キー連続対処
        if flg {
            hugou = sender.tag
            return
        }
        
        // オペランド2
        let ope02 = Int(lbView.text!) ?? 0
        
        switch hugou {
        case 1:
            ope01 += ope02
        case 2:
            ope01 -= ope02
        case 3:
            ope01 *= ope02
        case 4:
            if ope02 == 0 {
                lbView.text = "Error"
                flg = true
                ope01 = 0
                hugou = 1
                return
            }
            ope01 /= ope02
        case 9:
            ope01 = ope02
        default:
            break
        }
        
        // 計算結果
        lbView.text = String(ope01)
        
        hugou = sender.tag
        
        flg = true
    }
    
    // クリアキーの処理
    @IBAction func clearBtn(_ sender: UIButton) {
        lbView.text = "0"
        flg = true
        ope01 = 0
        hugou = 1
        
    }
}

