import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-all"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    let checkboxes = document.getElementsByClassName("employee-checker");
    let count = 0;
    for (let i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        count += 1;
      }
    }
    if (count == checkboxes.length) { this.checkboxTarget.checked = true; }
  }

  update() {
    let checkboxes = document.getElementsByClassName("employee-checker");
    if (this.checkboxTarget.checked) {
      for (let i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = true;
        console.log(checkboxes[i]);
      }
    } else {
      for (let i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = false;
        console.log(checkboxes[i]);
      }
    }
  }
}
