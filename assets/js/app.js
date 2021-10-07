// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
// import "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"
import Alpine from "alpinejs";

window.Alpine = Alpine;
Alpine.start();
let hooks = {};

let Uploaders = {}
Uploaders.S3 = function(entries, onViewError){
  entries.forEach(entry => {
    // console.log("entry")
    // console.log(entry)
    let formData = new FormData()
    let {url, fields} = entry.meta
    // console.log("url")
    // console.log(url)
    
    // console.log("fields")
    // console.log(fields)
    
    Object.entries(fields).forEach(([key, val]) => formData.append(key, val))
    formData.append("file", entry.file)
    let xhr = new XMLHttpRequest()
    onViewError(() => xhr.abort())
    xhr.onload = () => ((xhr.status === 204 || 200) ? entry.progress(100) : entry.error())
    xhr.onerror = () => entry.error()
    xhr.upload.addEventListener("progress", (event) => {
      // console.log("addEventListener event")
      // console.log(event)
  
      if(event.lengthComputable){
        let percent = Math.round((event.loaded / event.total) * 100)
        if(percent < 100){ entry.progress(percent) }
      }
    })
    xhr.open("POST", url, true)
    xhr.send(formData)
  })
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {uploaders: Uploaders, params: {_csrf_token: csrfToken}, hooks: hooks, dom: {
  onBeforeElUpdated(from, to) {
    if (from._x_dataStack) {
      window.Alpine.clone(from, to);
    }
  },
},
})


// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

