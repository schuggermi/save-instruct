import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="order-by-drag"
export default class extends Controller {
  connect() {
    this.Sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  };
  end(event){
    console.log(event);
  }
}

//   end(event) {
//     console.log("Hello!")
//     event.preventDefault()
//     // let id = event.item.dataset.id;
//     // let data = new FormData();
//     // data.append("position", event.newIndex + 1);
//     // Rails.ajax({
//     //   url: this.data.get("url").replace(":id", id),
//     //   type: "PATCH",
//     //   data: data,
//     // });
//   }
// }




// on end
