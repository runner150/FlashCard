//
//  ViewController.swift
//  Flash Card
//
//  Created by Kyle Ettinger on 8/30/16.
//  Copyright © 2016 Kyle Ettinger. All rights reserved.
//

import UIKit




extension Array {
    
    mutating func shuffle()
        
    {
        
        for _ in 0..<10
            
        {
            sortInPlace { (_,_) in arc4random() < arc4random() }
            
        }
        
    }
    
    
}






class ViewController: UIViewController {
    
    
    
    let container = UILabel()
    let greenSquare = UILabel()
    let blueSquare = UILabel()
    
    

    var cards :Array<Card> = [
        
        Card(front: "Hola", back: "Hello"),
        Card(front: "Adiós", back: "Goodbye"),
        Card(front: "Buenos días", back: "Good Morning"),
        Card(front: "Buenos tardes", back: "Good Afternoon"),
        Card(front: "Buenos noches", back: "Good Evening"),
        Card(front: "Hola, me llamo", back: "Hello, My Name is"),
        Card(front: "¿Cómo se llama usted?", back: "What Is Your Name?"),
        Card(front: "¿Cómo está usted?", back: "How Are You?"),
        Card(front: "Estoy bien", back: "I Am Fine"),
        Card(front: "Mucho gusto", back: "Nice To Meet You"),
        Card(front: "Hasta luego", back: "See You Later"),
        Card(front: "¿Dónde está el baño?", back: "Where Is The Restroom?"),
        Card(front: "Estoy perdido", back: "I Am Lost"),
        Card(front: "Con permiso", back: "Excuse Me"),
        Card(front: "Por favor", back: "Please"),
        Card(front: "Gracías", back: "Thank You"),
        Card(front: "Lo siento", back: "I'm Sorry"),
        Card(front: "Salud", back: "Bless You"),
        Card(front: "De nada", back: "You Are Welcome"),
        Card(front: "¿Cuánto cuesta?", back: "How Much Does It Cost?"),
        Card(front: "¿Cuántos hay?", back: "How Many Are There?"),
        Card(front: "¿Quiere comprarlo usted?", back: "Do You Want To Buy This?"),
        Card(front: "¿Qué hora es?", back: "What Time Is It?"),
        Card(front: "Sí", back: "Yes"),
        Card(front: "No", back: "No"),
        Card(front: "Yo no comprendo", back: "I Do Not Understand"),
        Card(front: "¿Quièn?", back: "Who?"),
        Card(front: "¿Por què?", back: "Why?"),
        Card(front: "Agua", back: "Water"),
        Card(front: "Ahora", back: "Now"),
        Card(front: "Año", back: "Year"),
        Card(front: "Aquí", back: "Here")
        
        

        
    ]
    

    
    var currentCard = 0
    var showFront = true
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // set container frame and add to the screen
        self.container.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.view.addSubview(container)
        
        // set red square frame up
        // we want the blue square to have the same position as redSquare
        // so lets just reuse blueSquare.frame
        self.greenSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.blueSquare.frame = greenSquare.frame
        
        // set background colors
        self.greenSquare.backgroundColor = UIColor.greenColor()
        self.blueSquare.backgroundColor = UIColor.blueColor()
        
        // for now just add the redSquare
        // we'll add blueSquare as part of the transition animation
        self.container.addSubview(self.greenSquare)
   
    
        
        showCard()
        cards.shuffle()
        

    
        
    
    
    
    }

    
    
    @IBAction func nextButtonTapped(sender: AnyObject) {
        
        // create a 'tuple' (a pair or more of objects assigned to a single variable)
        var views : (frontView: UILabel, backView: UILabel)
        
        if ((self.greenSquare.superview) != nil) {
            views = (frontView: self.greenSquare, backView: self.blueSquare)
        }
        else {
            views = (frontView: self.blueSquare, backView: self.greenSquare)
        }
        
        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
        
        // with no animation block, and a completion block set to 'nil' this makes a single line of code
        UILabel.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
        
    }
    
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        
        // create a 'tuple' (a pair or more of objects assigned to a single variable)
        var views : (frontView: UILabel, backView: UILabel)
        
        if ((self.greenSquare.superview) != nil) {
            views = (frontView: self.greenSquare, backView: self.blueSquare)
        }
        else {
            views = (frontView: self.blueSquare, backView: self.greenSquare)
        }
        
        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionCurlDown
        
        // with no animation block, and a completion block set to 'nil' this makes a single line of code
        UILabel.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
        
    }

    
    @IBAction func flipCardButtonTapped(sender: AnyObject) {
        
        // create a 'tuple' (a pair or more of objects assigned to a single variable)
        var views : (frontView: UILabel, backView: UILabel)
        
        if ((self.greenSquare.superview) != nil) {
            views = (frontView: self.greenSquare, backView: self.blueSquare)
        }
        else {
            views = (frontView: self.blueSquare, backView: self.greenSquare)
        }
        
        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionFlipFromLeft
        
        // with no animation block, and a completion block set to 'nil' this makes a single line of code
        UILabel.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
        
    }

    
    func showCard() {
        
        if (self.showFront) {
            
            self.greenSquare.text = self.cards[self.currentCard].front
            
        } else {
            
            self.blueSquare.text = self.cards[self.currentCard].back
        }
        
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

