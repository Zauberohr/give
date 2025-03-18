import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["togglableElement"]

  fire(event) {
    this.togglableElementTargets.forEach((request) => {
      request.classList.toggle("d-none");
    })
    if (event.currentTarget.innerText === 'Requests Recieved'){
      event.currentTarget.innerText = 'Your Requests'
    } else {
      event.currentTarget.innerText = 'Requests Recieved'
    }
  }
}
