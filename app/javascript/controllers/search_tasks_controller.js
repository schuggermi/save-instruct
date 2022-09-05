import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-tasks"
export default class extends Controller {
  static targets = ["form"];

  // connect() {
  //   console.log("Hello form search tasks controller");
  // }

  DisplaySearchForm() {
    this.formTarget.classList.toggle("display-form");
  }
}
