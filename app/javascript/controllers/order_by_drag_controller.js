import { Controller } from "@hotwired/stimulus"
import { Sortable } from "index"


// Connects to data-controller="order-by-drag"
export default class extends Controller {
  connect() {
    console.log("Hello!")
    // this.sortable = Sortable.create(this.element, {
    //   onEnd: this.end.bind(this),
    // });
  }

  end(event) {
    console.log("Hello!")
    event.preventDefault()
    // let id = event.item.dataset.id;
    // let data = new FormData();
    // data.append("position", event.newIndex + 1);
    // Rails.ajax({
    //   url: this.data.get("url").replace(":id", id),
    //   type: "PATCH",
    //   data: data,
    // });
  }
}





// on end
