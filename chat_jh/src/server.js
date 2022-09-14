import express from "express";
import http from "http";
import {Server} from "socket.io";
import { instrument } from "@socket.io/admin-ui";
// import WebSocket from "ws";

const app = express();

app.set("view engine", "pug");
app.set("views", __dirname + "/views");
app.use("/public", express.static(__dirname + "/public"));
app.get("/",(_,res)=> res.render("home"));
app.get("/*",(_,res)=> res.redirect("/"));

const handleListen = () => console.log('Listening on http://localhost:3000');
//app.listen(3000,handleListen);

const httpServer = http.createServer(app);
const wsServer = new Server(httpServer,  {
    cors: {
      origin: ["https://admin.socket.io"],
      credentials: true,
    },
 });
 instrument(wsServer, {
    auth: false
  });

function publicRooms(){
    const {
        sockets:{
            adapter:{sids, rooms },
        },
    } = wsServer;
    // const sids = wsServer.sockets.adapter.sids;
    // const rooms = wsServer.sockets.adapter.rooms;
    const publicRooms = [];
    rooms.forEach((_,key)=>{
        if(sids.get(key) === undefined){
            publicRooms.push(key);
        }
    });
    return publicRooms;
}

function countRoom(roomName){
    return wsServer.sockets.adapter.rooms.get(roomName)?.size;
}


wsServer.on("connection" , (socket)=>{
    // console.log(socket);
    //wsServer.socketsJoin("announcement");
    socket["nickname"]="Anon";
    socket.onAny((event)=>{
        console.log(wsServer.sockets.adapter);
        console.log(`Socket Event:${event}`);
    });
    socket.on("enter_room",(roomName, done)=>{
        console.log("socket.id: "+socket.id);
        console.log("roomName: "+roomName);
        console.log("socket.rooms: "+socket.rooms);
        socket.join(roomName);
        done();
        socket.to(roomName).emit("welcome", socket.nickname, countRoom(roomName));
        wsServer.sockets.emit("room_change",publicRooms());
        // console.log(socket.rooms);
        // setTimeout(()=>{
        //     done("hello from the backend");
        // }, 10000);
    });
    socket.on("disconnecting",()=>{
        socket.rooms.forEach(room=>socket.to(room).emit("bye", socket.nickname, countRoom(room)-1)
        );
        //wsServer.sockets.emit("room_change",publicRooms());
    });
    socket.on("disconnect",()=>{
        wsServer.sockets.emit("room_change",publicRooms());
    });
    socket.on("new_message",(msg, room, done)=>{
        socket.to(room).emit("new_message", `${socket.nickname}:${msg}`);
        done();
    });
    socket.on("nickname", (nickname) =>(socket["nickname"]= nickname));
});



// const wss = new WebSocket.Server({ server });

// const sockets = [];

// wss.on("connection", (socket) => {
//     sockets.push(socket);
//     socket["nickname"]="Anon";
//     console.log("Connected to Browser 👍");
//     socket.on("close",()=>console.log("Disconnected from the Browser ❌"));
//     socket.on("message",(msg)=>{
//         const message = JSON.parse(msg);
//         switch(message.type){
//             case "new_message":
//                 sockets.forEach(aSocket=>aSocket.send(`${socket.nickname}: ${message.payload}`));
//             case "nickname":
//                 // console.log(message.payload);
//                 socket["nickname"] = message.payload;
//         }
//         // if(parsed.type==="new_message"){
//         //     sockets.forEach(aSocket=>aSocket.send(parsed.payload));
//         // }else if(parsed.type==="nickname"){
//         //     console.log(parsed.payload);
//         // }
//        // sockets.forEach(aSocket=>aSocket.send(message.toString()));
//         //  console.log(message.toString());
//         // socket.send(message.toString());
//     });
//     // socket.send("hello");
// });

httpServer.listen(3000,handleListen);

