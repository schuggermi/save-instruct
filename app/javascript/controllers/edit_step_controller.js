import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-step"
export default class extends Controller {
  static targets = ["infos", "form"]

  display() {
    this.formTarget.classList.remove("d-none")
    this.infosTarget.classList.add("d-none")
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.infosTarget.outerHTML = data
      })
      this.formTarget.classList.add("d-none")
      this.infosTarget.classList.remove("d-none")
  }
}
