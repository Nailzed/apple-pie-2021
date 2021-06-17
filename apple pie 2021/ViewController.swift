//
//  ViewController.swift
//  apple pie 2021
//
//  Created by Сергей Земсков on 08.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //MARK: - Properties
    
    var currentGame: Game!
    let incorrectMovesAllowed = 7
    var listOfWords = [
        "Австралия",
        "Австрия",
        "Азербайджан",
        "Албания",
        "Англия",
        "Андорра",
        "Аргентина",
        "Армения",
        "Афганистан",
        "Белоруссия",
        "Бельгия",
        "Болгария",
        "Боливия",
        "Босния и Герцеговина",
        "Бразилия",
        "Бруней",
        "Буркина-Фасо",
        "Великобритания",
        "Венгрия",
        "Венесуэла",
        "Вьетнам",
        "Гаити",
        "Гана",
        "Гватемала",
        "Гвинея",
        "Германия",
        "Гибралтар",
        "Гондурас",
        "Гонконг",
        "Греция",
        "Грузия",
        "Дания",
        "Египет",
        "Зимбабве",
        "Израиль",
        "Индия",
        "Индонезия",
        "Иордания",
        "Ирак",
        "Иран",
        "Ирландия",
        "Исландия",
        "Испания",
        "Италия",
        "Йемен",
        "Кабо-Верде",
        "Казахстан",
        "Камбоджа",
        "Камерун",
        "Канада",
        "Катар",
        "Кения",
        "Киргизия",
        "Китай",
        "Колумбия",
        "Корея",
        "Коста-Рика",
        "Куба",
        "Кувейт",
        "Лаос",
        "Латвия",
        "Либерия",
        "Ливан",
        "Ливия",
        "Литва",
        "Лихтенштейн",
        "Люксембург",
        "Маврикий",
        "Мавритания",
        "Мадагаскар",
        "Малайзия",
        "Мали",
        "Мальдивы",
        "Мальта",
        "Марокко",
        "Мексика",
        "Мозамбик",
        "Молдавия",
        "Монако",
        "Монголия",
        "Намибия",
        "Непал",
        "Нигерия",
        "Нидерланды",
        "Никарагуа",
        "Новая Зеландия",
        "Норвегия",
        "ОАЭ",
        "Оман",
        "Пакистан",
        "Панама",
        "Папуа — Новая Гвинея",
        "Парагвай",
        "Перу",
        "Польша",
        "Португалия",
        "Пуэрто-Рико",
        "Кипр",
        "Россия",
        "Руанда",
        "Румыния",
        "Сальвадор",
        "Самоа",
        "Саудовская Аравия",
        "Северная Ирландия",
        "Северная Македония",
    ].shuffled()
    var totalWins = 0{
        didSet {
            newRound()
        }
    }
    var totalLosses = 0{
        didSet {
            newRound()
        }
    }
    
    //MARK: - Methods
    func enableButtons(_ enable: Bool = true) {
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    
    
    func newRound () {
        enableButtons(false)
        guard !listOfWords.isEmpty else {
            updateUI()
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enableButtons()
    }
    
    func updateState(){
        if currentGame.incorrectMovesRemaining < 1{
            totalLosses += 1
        }else if currentGame.guessedWord == currentGame.word{
            totalWins += 1
        }else{
            updateUI()
        }
    }
    
    
    func updateCorrectWordLabel(){
        var displayWord = [String]()
        for letter in currentGame.guessedWord{
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
    }
    
    func updateUI(){
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNumber = movesRemaining < 0 ? 0 : movesRemaining < 8 ? movesRemaining : 7
        //let imageNumber = (movesRemaining + 64) % 8 другой вариант
        let image = "Tree\(imageNumber)"
        treeImageView.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Выигрыши:\(totalWins), Проигрыши:\(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    
    
    //MARK: - IB Actions
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateState()
    }
    
    
}

