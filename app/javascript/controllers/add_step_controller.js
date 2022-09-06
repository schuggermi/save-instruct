import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-step"
export default class extends Controller {
  static targets = ["list"]

  connect() {
    console.log("Connecting to data-controller")
  }

  addStep() {
    if (this.listTarget.classList.contains("d-none")) {
      this.listTarget.classList.remove("d-none")
    } else {
      this.listTarget.classList.add("d-none")
    }
  }
}

// const url = this.listTarget.action
// fetch(url, {
//   method: "PATCH",
//   headers: { "Accept": "text/plain" },
//   body: new FormData(this.listTarget)
// })
// .then(response => response.text())
// .then((data) => {
//   this.infosTarget.outerHTML = data
// })
