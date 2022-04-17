# Team Group
1. 63130500055 Tarathep Siripis
2. 63130500056 Thanyakorn Thalaengdi
3. 63130500060 Thiraphat Itamonchai
4. 63130500070 Natasia Yusuwapan
5. 63130500078 Paramat Pet-in

# GameHub 	:video_game:
**Created by  (ID:055,056,060,070,078)**
## Introduction 	:rocket:
GameHub is a unified library for all our games (blackjack,matching game). It allows our to store  games from different platforms into one program to make it easier for our to manage our games and gamehub is built with vue3 and vite with optional basic strategy hints.
All of the animations are performed via CSS.

## NPM Script :computer:
- Install npm 

```
npm install
```
- Run Dev

```
npm run dev
```
- Run Backend

```
npm run backend
```
## Component :computer:

## 1.FontGameHub 	:clipboard:
#### Navbar
-gamelogo , on the left of navbar, showing the game Logo that router to gamehub.

-leaderboard , on the second of navbar, showing the 3 best  result score board.

-register , on the third of navbar, showing register icon for user do not have account.

-login,on the rigth of navbar,showing login icon for  user have account.

when login success

-register will change to profile user ,on the third of navbar, showing the profile user and  can edit , delete user.

-login  will change to logout icon,on the rigth of navbar,showing logout for user.

#### Body
Game,show all game

-blackjack

-Wizard Matching

## 2.BlackJackGame  :spades::hearts::clubs::diamonds:
-ButtonHistory -> Show the history of the game
-Player -> Show interface of player and processes game operation. (player)
-Com -> Show interface of player and processes game operation. (Computer)
-ButtonNextRound -> Restart the game, Find the winner and show name of winner.
-Rule -> Show the rule of the game.
-Button-Final-Feild -> Button restart and end the game, set all value to default value.

## 3.MatchingGame :jigsaw::teddy_bear::jigsaw::teddy_bear:
#### Navbar
-gamelogo on the left of navbar, showing the game Logo that router to gamehub.

-leaderboard , on the second of navbar, showing the 3 best  result score board.

-register , on the third of navbar, showing register icon for user do not have account.

-login,on the rigth of navbar,showing login icon for  user have account.

#### Body

show matching game by starting the game by pressing the Start Game button.
