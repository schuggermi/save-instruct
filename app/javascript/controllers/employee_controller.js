import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="employee"
export default class extends Controller {
  connect() {
    console.log("Hello from Employee Controller");
  }
}
