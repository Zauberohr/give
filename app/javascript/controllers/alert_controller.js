import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="alert"
export default class extends Controller {

  static targets = ["button"]

  connect() {
    setTimeout(() => {
      this.buttonTarget.click()
    }, 4000);
  }
}
