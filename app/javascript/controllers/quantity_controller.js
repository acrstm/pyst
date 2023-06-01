import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quantity"
export default class extends Controller {
  static targets = ["minus", "inputField", "plus", "math"]

  connect() {
    console.log(this.minusTarget, Number(this.inputFieldTarget.value), this.plusTarget)
  }

  minusAction(){

    this.minusTargets.forEach(element => {
      element.addEventListener("click", (event) => {
        // const inputField
      })
    });
  }
}
