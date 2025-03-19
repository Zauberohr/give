// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import Swal from "sweetalert2";
import confetti from "canvas-confetti";

document.addEventListener("DOMContentLoaded", function () {
    const completedPopup = document.getElementById("completed-popup");
    console.log(completedPopup);

    if (completedPopup) {
    const message =
        "BAM! 10 credits have left your wallet, hope it was worth it!";

    Swal.fire({
        title: "💰 Transaction Complete!",
        text: message,
        icon: "success",
        timer: 3000,
        showConfirmButton: false,
    });

    confetti({
        particleCount: 150,
        spread: 70,
        origin: { y: 0.6 },
    });

    let audio = new Audio("");
    audio.play();

    setTimeout(() => {
        window.location.href = completedPopup.dataset.redirect;
    }, 3000);
    }
});

