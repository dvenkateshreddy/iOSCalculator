//
//  ViewController.swift
//  Calculator
//
//  Created by Venkatesh Reddy on 15/08/17.
//  Copyright © 2017 nevergiveup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var performMath: Bool = false
    var operation: intptr_t = 0
    var outputRecieved: intptr_t = 0
    var onScreenValue: String = ""

    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttons(_ sender: UIButton) {
        if outputRecieved == 19 {
            label.text = ""
            currentNumber = 0
            previousNumber = 0
            performMath = false
            outputRecieved = 0
        }
        if performMath == true
        {
            if sender.tag == 11
            {
            }
            else
            {
                label.text = String(sender.tag-1)
            }
            performMath = false
        }
        else
        {
            if sender.tag == 11
            {
                if  currentNumber == 0
                {
                    label.text = "0."
                }
                else
                {
                    label.text = label.text! + "."
                }
            }
            else
            {
                label.text = label.text! + String(sender.tag-1)
            }
        }
        if label.text != "" || label.text != "/" || label.text != "x" || label.text != "-" || label.text != "+" || label.text != "."
        {
            currentNumber = Double(label.text!)!
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if label.text != "" && sender.tag != 12 && sender.tag !=  13 && sender.tag != 14 && sender.tag != 19
        {
            onScreenValue = label.text!
            
            if label.text != "+" && label.text != "-" && label.text != "/" && label.text != "x"
            {
                previousNumber = Double(label.text!)!
            }
            
            if sender.tag == 15
            {
                label.text = "/"
            }
            else if sender.tag == 16
            {
                label.text = "x"
            }
            else if sender.tag == 17
            {
                label.text = "-"
            }
            else if sender.tag == 18
            {
                label.text = "+"
            }
            
            operation = sender.tag
            performMath = true
            outputRecieved = sender.tag
        }
        else if sender.tag == 19
        {
            if label.text == "/" || label.text == "x" || label.text == "-" || label.text == "+"
            {
                label.text = onScreenValue
            }
            else if operation == 15
            {
                if currentNumber == 0
                {
                    label.text = "Can't divide by 0"
                }
                else
                {
                    label.text = String(previousNumber / currentNumber)
                }
            }
            else if operation == 16
            {
                label.text = String(previousNumber * currentNumber)
            }
            else if operation == 17
            {
                label.text = String(previousNumber - currentNumber)
            }
            else if operation == 18
            {
                label.text = String(previousNumber + currentNumber)
            }
            
            outputRecieved = sender.tag
        }
        else if sender.tag == 13 && label.text != ""
        {
            if outputRecieved == 19 {
                label.text = ""
                currentNumber = 0
                previousNumber = 0
                performMath = false
                outputRecieved = 0
            }
            else
            {
                label.text = label.text!.substring(to: label.text!.index(before: label.text!.endIndex))
            }
        }
        else if sender.tag == 12
        {
            label.text = ""
            currentNumber = 0
            previousNumber = 0
            performMath = false
            outputRecieved = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

