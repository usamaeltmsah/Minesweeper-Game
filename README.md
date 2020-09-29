# Minesweeper-Game

## Table of contents
* [Installation](#installation)
* [Minesweeper](#minesweeper)
    * [Introduction](#introduction)
    * [Usage](#usage)
    * [Demo](#demo)
    
## Installation
- It's required to install [ruby 2.7.0](https://www.ruby-lang.org/en/documentation/installation/)

    - If already installed try to get version Using *Comamnd* 
    ```bash 
    ruby -v
    ```
- You also may need to install this [Colorize package](https://github.com/fazibear/colorize) for advanced UI colors

    ```bash
    gem install colorize
    ```
    
 - Install [YAML](https://github.com/ruby/yaml) to save game
 ```bash
 gem install yaml
 ```
    
# Minesweeper

## Introduction
This is a Ruby version of **Minesweeper** Game :D

<img alt="Minesweeper" src="https://image.winudf.com/v2/image1/Y29tLmp1cmFqa3Vzbmllci5taW5lc3dlZXBlcl9zY3JlZW5fNF8xNTQ5MzEwMTY1XzAzNw/screen-4.jpg?fakeurl=1&type=.jpg" width="500">

## Usage 

> **_NOTE:_** Make sure you are in the same directory of project files

open `CMD` or `Terminal`, and `cd` to the project directory

In trermial write 

```bash
ruby "Game.rb"
```

It works!! :smiley:

## Demo 

```ruby
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  
*  *  *  *  *  *  *  *  *  

Enter an action ex. `e` -> Explore or `f` -> Flag/Unflag and `s` -> Save > e
Enter position ex. `1 2` > 5 4
_  _  _  _  1  *  *  *  *  
1  1  _  _  1  1  2  *  *  
*  1  _  _  _  _  1  *  *  
*  1  _  _  _  1  1  *  *  
*  1  1  1  _  1  *  *  *  
*  *  *  1  _  1  2  *  *  
*  *  1  1  _  _  1  *  *  
*  *  1  _  1  1  2  *  *  
*  *  1  _  1  *  *  *  *  

Enter an action ex. `e` -> Explore or `f` -> Flag/Unflag and `s` -> Save > e
Enter position ex. `1 2` > 5 2
_  _  _  _  1  *  *  *  *  
1  1  _  _  1  1  2  *  *  
*  1  _  _  _  _  1  *  *  
*  1  _  _  _  1  1  *  *  
*  1  1  1  _  1  *  *  *  
*  *  🚩 1  _  1  2  *  *  
*  *  1  1  _  _  1  *  *  
*  *  1  _  1  1  2  *  *  
*  *  1  _  1  *  *  *  *  
_  _  _  _  1  *  *  *  *  
1  1  _  _  1  1  2  *  *  
*  1  _  _  _  _  1  *  *  
*  1  _  _  _  1  1  *  *  
*  1  1  1  _  1  *  *  *  
*  *  🚩 1  _  1  2  *  *  
*  *  1  1  _  _  1  *  *  
*  *  1  _  1  1  2  *  *  
*  *  1  _  1  *  *  *  *  

Enter an action ex. `e` -> Explore or `f` -> Flag/Unflag and `s` -> Save > s
Enter file name to save at: 1.txt
```
```bash
ruby "Game.rb" 1.txt
```
```ruby
_  _  _  _  1  *  *  *  *  
1  1  _  _  1  1  2  *  *  
*  1  _  _  _  _  1  *  *  
*  1  _  _  _  1  1  *  *  
*  1  1  1  _  1  *  *  *  
*  *  🚩 1  _  1  2  *  *  
*  *  1  1  _  _  1  *  *  
*  *  1  _  1  1  2  *  *  
*  *  1  _  1  *  *  *  *  

Enter an action ex. `e` -> Explore or `f` -> Flag/Unflag and `s` -> Save > 
```
