import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="order-by-drag"
export default class extends Controller {
static values = {url: String}
static targets = ["switchlabel"]

  connect() {
    this.Sortable = Sortable.create(this.element, {
      onEnd: this.updateOrder.bind(this),
    })
    this.Sortable.options.disabled = true
  };

  updateOrder(event){
    const url = event.item.dataset.orderByDragUrl
    console.log(url)
    fetch(url + `?new_position=${event.newIndex}`)
  }

  detach() {
    if (this.Sortable.options.disabled == false) {
      this.Sortable.options.disabled = true;
      this.switchlabelTarget.innerText = "Sort off"
    } else {
      this.Sortable.options.disabled = false;
      this.switchlabelTarget.innerText = "Sort on"
    }
  }
}
