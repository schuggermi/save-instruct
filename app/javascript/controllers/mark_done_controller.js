import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-done"
export default class extends Controller {
  static targets = ["form"]

  // connect() {
  //   console.log("hello from mark done controller");
  // }

  update(event) {
    event.preventDefault();

    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {
      console.log(data)
      this.formTarget.outerHTML = data
    })
  }
}