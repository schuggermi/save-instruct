import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-items"
export default class extends Controller {
  static targets = ["form", "content", "input"];

  displaySearchForm() {
    this.formTarget.classList.toggle("display-form");
    this.inputTarget.focus()
  }

  search() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`

    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.contentTarget.innerHTML = data
    })
  }

  showSearchedEmployees() {
    console.log("display searched");

    const searchValue = this.inputTarget.value.toLowerCase();

    let liItems = document.querySelectorAll('.employee-list li');

    liItems.forEach(item => {
      if (item.firstElementChild.innerText.toLowerCase().includes(searchValue)) {
        item.classList.add("d-flex");
        item.style.display = "flex";
      } else {
        item.classList.remove("d-flex");
        item.style.display = "none";
      }
    });
  }
}
