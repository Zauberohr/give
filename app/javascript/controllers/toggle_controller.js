import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["sent", "received", "sentButton", "receivedButton"]

  fireSent(event) {
    console.log(this.sentTarget);

    // Toggle the requests
    this.sentTarget.classList.remove("d-none");
    this.receivedTarget.classList.add("d-none");

    // Make sent button primary
    this.sentButtonTarget.classList.add("btn-primary");
    this.sentButtonTarget.classList.remove("btn-outline-primary");

    // Make received button outline
    this.receivedButtonTarget.classList.remove("btn-primary");
    this.receivedButtonTarget.classList.add("btn-outline-primary");
  }

  fireReceived(event) {
    console.log(this.receivedTarget);

    this.sentTarget.classList.add("d-none");
    this.receivedTarget.classList.remove("d-none");

    this.sentButtonTarget.classList.remove("btn-primary");
    this.sentButtonTarget.classList.add("btn-outline-primary");

    this.receivedButtonTarget.classList.add("btn-primary");
    this.receivedButtonTarget.classList.remove("btn-outline-primary");
  }
}
