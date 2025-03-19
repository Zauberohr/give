import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";
import confetti from "canvas-confetti";

// Connects to data-controller="confettis"
export default class extends Controller {
  static values = {
    sound: String,
  };

  connect() {
    const completedPopup = document.getElementById("completed-popup");

    if (completedPopup) {
      const message =
        "BAM! 10 credits have left your wallet, hope it was worth it!";

      Swal.fire({
        title: "💰 Transaction Complete!",
        text: message,
        icon: "success",
        timer: 5000,
        showConfirmButton: false,
      });

      confetti({
        particleCount: 150,
        spread: 70,
        origin: { y: 0.6 },
        zIndex: 1070,
      });

      console.log(this.soundValue);

      let audio = new Audio(this.soundValue);
      audio.play();

      setTimeout(() => {
        window.location.href = completedPopup.dataset.redirect;
      }, 5000);
    }
  }
}
