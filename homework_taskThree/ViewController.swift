//
//  ViewController.swift
//  homework_taskThree
//
//  Created by Lab122-09 on 12/2/17.
//  Copyright © 2017 Lab122-09. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        
        loadSnakeView()
    }
    
    func loadSnakeView()
    {
        let numOfSnakes: Int = 5
        
        let xCoord: CGFloat = self.view.bounds.width / 2 - self.view.bounds.width / 4
        let yCoord: CGFloat = self.view.bounds.height / 2 - self.view.bounds.height / 4
        let radius: CGFloat = self.view.bounds.width / 4
        
        let snakeView: SnakeCircleView = SnakeCircleView(frame: CGRect(x: xCoord, y: yCoord, width: radius, height: radius), numOfSnakes: numOfSnakes)
        self.view.addSubview(snakeView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

