var express = require("express");
var app = express();
app.set("view engine", "ejs");
app.set("views", "./views");
app.use(express.static("public"));
var server = require("http").Server(app);
var io = require("socket.io")(server);

server.listen(3000);
var bolPing = true
var bolMoveNumber = true
var lockImg = "a"

//Mongoose
const mongoose = require('mongoose');
mongoose.connect('mongodb+srv://pokemon:9w8nbzZXnEpnQFbl@cluster0.tjy7p.mongodb.net/pokemon2022?retryWrites=true&w=majority',function(err){
    if(err){
        console.log(err)
    }else{
        console.log("Mongoose connected successfully!")
    }
});

//body-parser
var bodyParser = require('body-parser');
const { resolve } = require("path");
const { rejects } = require("assert");
const { isObjectIdOrHexString } = require("mongoose");
const { on } = require("events");
const { send } = require("process");
const { flags } = require("socket.io/lib/namespace");


app.use(bodyParser.urlencoded({ extended: false }));
//socket
io.on("connection",function(socket){

    console.log("New connection: "+socket.id)
 
    socket.on("lockImg",function(data){
        console.log(data)
        lockImg = data
    })
 if(bolPing == false){
    io.sockets.emit("PING")
 }
    socket.on("disconnect",function(){
        console.log(socket.id+": has disconnect")
    })
})
        var sendNumber = function(sendNumberr){
            return new Promise((resolve,rejects)=>{
                setTimeout(() => {
                    
                    if(sendNumberr>=1 && sendNumberr<= 30){
        sendNumberr -= 1
        io.sockets.emit("SERVER SEND NUMBER",sendNumberr)
        
        resolve(sendNumberr)
                    }   
                }, 1000);
              
            })}
           lapSendNumber(30)
           function lapSendNumber(sendNumberr){
               sendNumber(sendNumberr).then((newSendNumberr)=>{
                
        if(newSendNumberr == 0){
        bolPing = false
        io.sockets.emit("PING")        
            var sendStar = function(sendStarr){
                return new Promise((resolve,rejects)=>{
                    setTimeout(() => {
                        if( sendStarr <=4 && sendStarr>=0){
        sendStarr -= 1;
        io.sockets.emit("START",sendStarr)
        
        resolve(sendStarr)
                        }  
                    }, 1000);
                   
                })
            }
            lapSendStar(4)
            function lapSendStar(sendStarr){
                sendStar(sendStarr).then((newSendStarr)=>{
                    if(newSendStarr == -1){  
                        bolMoveNumber = false
                        var test = false;
                        var runNumber = function(runNumberr){
                            return new Promise((resolve,rejects)=>{
                                setTimeout(() => {
                                    if(runNumberr<=8 & runNumberr>=0){
                                        if(runNumberr == 8){runNumberr = 0}
                                        runNumberr+=1;
                                        io.sockets.emit("runNumber",runNumberr)
                                        resolve(runNumberr)
                                    
                            }}, 50);
                            })
                        }
                        lapRunNumber(0)
                        function lapRunNumber(runNumberr){
                            runNumber(runNumberr).then((newRunNumberr)=>{
                                if(bolMoveNumber == false){ lapRunNumber(newRunNumberr)}
                               else{}
                            })
                        } 

        var moveNumber1 = function(moveNumberr1){
            
            return new Promise((resolve,rejects)=>{
                setTimeout(() => {
                    moveNumberr1 += Math.floor(Math.random() * 10 - 4);
                    console.log(moveNumberr1)
                  
                    io.sockets.emit("moveNumber1",moveNumberr1)
                    
                    resolve(moveNumberr1)
                },50);
            })
        }
        lapMoveNumber1(10)
        function lapMoveNumber1(moveNumberr1){
            moveNumber1(moveNumberr1).then((newMoveNumberr1)=>{
                if(newMoveNumberr1 >= 780){
                    test = true
                    bolMoveNumber = true
                    bolPing = true
                    lapSendNumber(30)
                    }
                
                else if(lockImg == "avatar_animals/1" && test == true){
                    io.sockets.emit("winOrLose","YOU LOSE")
                }
                else if(lockImg == "a" & test == true){
                    
                    io.sockets.emit("winOrLose","")
                }
                else if(test == true){}
                else{lapMoveNumber1(newMoveNumberr1)}
            
            })
        }
        var moveNumber2 = function(moveNumberr2){
            return new Promise((resolve,rejects)=>{
                setTimeout(() => {
                    moveNumberr2 += Math.floor(Math.random() * 10 - 4);
                    console.log(moveNumberr2)
                   
                    io.sockets.emit("moveNumber2",moveNumberr2)
                    resolve(moveNumberr2)
                },50);
            })
        }
        lapMoveNumber2(10)
        function lapMoveNumber2(moveNumberr2){
            moveNumber2(moveNumberr2).then((newMoveNumberr2)=>{
                if(newMoveNumberr2 >= 780){
                 
                    test = true
                    bolMoveNumber = true
                    bolPing = true
                    lapSendNumber(30)
                    }
                
                else if(lockImg == "avatar_animals/2" && test == true){
                    
                    io.sockets.emit("winOrLose","YOU LOSE")
                }
                else if(lockImg == "a" && test == true){
                    io.sockets.emit("winOrLose","")
                }
                else if(test == true){}
                else{lapMoveNumber2(newMoveNumberr2)}
            })
        }
        var moveNumber3 = function(moveNumberr3){
            return new Promise((resolve,rejects)=>{
                setTimeout(() => {
                    moveNumberr3 += Math.floor(Math.random() * 10 - 4);
                    console.log(moveNumberr3)
                    io.sockets.emit("moveNumber3",moveNumberr3)
                    resolve(moveNumberr3)
                },50);
            })
        }
        lapMoveNumber3(10)
        function lapMoveNumber3(moveNumberr3){
            moveNumber3(moveNumberr3).then((newMoveNumberr3)=>{
                if(newMoveNumberr3 >= 780){
                  
                    test = true
                    bolMoveNumber = true
                    bolPing = true
                    lapSendNumber(30)
                    }
                
                else if(lockImg == "avatar_animals/3" && test == true){
                    io.sockets.emit("winOrLose","YOU LOSE")
                }
                else if(lockImg == "a" && test == true){
            
                    io.sockets.emit("winOrLose","")
                }
                else if(test == true){}
                else{lapMoveNumber3(newMoveNumberr3)}
            })
        }
        var moveNumber4= function(moveNumberr4){
            return new Promise((resolve,rejects)=>{
                setTimeout(() => {
                    moveNumberr4 += Math.floor(Math.random() * 10 - 4);
                    console.log(moveNumberr4)
                    io.sockets.emit("moveNumber4",moveNumberr4)
                    resolve(moveNumberr4)
                },50);
            })
        }
        lapMoveNumber4(10)
        function lapMoveNumber4(moveNumberr4){
            moveNumber4(moveNumberr4).then((newMoveNumberr4)=>{
                if(newMoveNumberr4 >= 780){
                
                    test = true
                    bolMoveNumber = true
                    bolPing = true
                    lapSendNumber(30)
                    }
                    else if(lockImg == "a" && test == true){
                        io.sockets.emit("winOrLose","")
                    }
                else if(lockImg == "avatar_animals/4" && test ==true){
                    io.sockets.emit("winOrLose","YOU LOSE")
                }
                else if(test == true){}
                else{lapMoveNumber4(newMoveNumberr4)}
            })
        }    
        
            }else{lapSendStar(newSendStarr)}})
            }
        }else{lapSendNumber(newSendNumberr)}
               })
           }
         
require("./routes/FileManager")(app)
require("./routes/Account")(app)

