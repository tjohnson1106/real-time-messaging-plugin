// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import { Socket } from "phoenix";

let socket = new Socket("/socket", { params: { token: window.userToken } });

let roomId = window.roomId;

socket.connect();

if (roomId) {
  // Now that you are connected, you can join channels with a topic:
  let channel = socket.channel(`room:${roomId}`, {});
  channel
    .join()
    .receive("ok", (resp) => {
      console.log("Joined successfully", resp);
    })
    .receive("error", (resp) => {
      console.log("Unable to join", resp);
    });

  channel.on(`room:${roomId}:new_message`, (message) => {
    console.log(message);
    displayMessage(message);
  });

  document.querySelector("#message-form").addEventListener("submit", (e) => {
    e.preventDefault();
    let input = e.target.querySelector("#message-body");

    channel.push("message:add", { message: input.value });

    input.value = "";
  });

  const displayMessage = (msg) => {
    let template = `
  <li class="list-group-item">
  ${msg.body}
  </li>
  `;

    document.querySelector("#display").innerHTML += template;
  };
}

export default socket;
