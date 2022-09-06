import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-step"
export default class extends Controller {
  static targets = ["list"]

  connect() {
    console.log("Hello from add step controller!")
  }

  addStep() {
    const newStep = `
    <div data-controller="edit-step" class="card pt-3 my-3" id="1">
  <div class="ps-2">
  <div class="px-3" style="line-height: 0.8" data-edit-step-target="infos">
    <p class="d-flex justify-content-between"><i data-action="click->edit-step#display" class="fa fa-pencil fa-1x text-danger"></i></p>
  <p class="text-warning"></p>
</div>


    <form class="simple_form d-none" id="edit_step_2" data-edit-step-target="form" data-action="submit->edit-step#update" novalidate="novalidate" action="/tasks/1/steps/2" accept-charset="UTF-8" method="post"><input type="hidden" name="_method" value="patch" autocomplete="off"><input type="hidden" name="authenticity_token" value="QNHjdQQ0zsC9MeF50byCy6l6yp9h8G1jlvIlA1_lQcSy3YMyR9hRCTP0DPDZcUyS-6iWoAe9nVCYk-OyR0EeQg" autocomplete="off">
  <div class="mb-3 text required step_instruction"><label class="form-label text required" for="step_instruction">Instruction <abbr title="required">*</abbr></label><textarea class="form-control is-valid text required" name="step[instruction]" id="step_instruction"></textarea></div>
  <div class="mb-3 text optional step_info"><label class="form-label text optional" for="step_info">Info</label><textarea class="form-control is-valid text optional" name="step[info]" id="step_info"></textarea></div>
  <div class="mb-3 integer optional step_order"><label class="form-label integer optional" for="step_order">Order</label><input class="form-control is-valid numeric integer optional" type="number" step="1" value="1" name="step[order]" id="step_order"></div>
  <input type="submit" name="commit" value="Update Step" data-disable-with="Update Step">
</form>
  </div>
</div>
    `
    console.log("Hello from add step action!")
    this.listTarget.insertAdjacentHTML('beforeend', newStep)
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
