import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="order-by-drag"
export default class extends Controller {
static values = {url: String}

  connect() {
    this.Sortable = Sortable.create(this.element, {
      onEnd: this.updateOrder.bind(this),
    })
    this.Sortable.options.disabled = true
  };

  updateOrder(event){
    const url = event.item.dataset.orderByDragUrl
    console.log(url)
    fetch(url + `?new_position=${event.newIndex + 1}`)
  }

  detach() {
    if (this.Sortable.options.disabled == false) {
      this.Sortable.options.disabled = true;
    } else {
      this.Sortable.options.disabled = false;
    }
  }
}
