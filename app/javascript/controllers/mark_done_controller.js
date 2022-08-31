import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-done"
export default class extends Controller {
  static targets = ["button"]

  // connect() {
  //   console.log("hello from mark done controller");
  // }

  update(event) {
    event.preventDefault();
    // console.log(event);
    // console.log(event.target.href);

    const url = `${event.target.href}`
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" }
      // body: ""
    })
      .then(response => response.text())
      .then((data) => {
        event.target.style.color = "red";
      })

  }
}
