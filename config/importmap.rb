# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "tom-select", to: "https://ga.jspm.io/npm:tom-select@2.3.1/dist/js/tom-select.complete.js"
pin "sweetalert2", to: "https://ga.jspm.io/npm:sweetalert2@11.7.2/dist/sweetalert2.all.js"
pin "canvas-confetti", to: "https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.module.mjs"
