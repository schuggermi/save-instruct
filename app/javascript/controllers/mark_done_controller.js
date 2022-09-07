import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mark-done"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    // console.log("hello from mark done controller");
    console.log("2")
  }

  update(event) {
    event.preventDefault();

    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())
    .then((data) => {

      this.formTarget.outerHTML = data

      for(var i=0; i<100; i++) {
        // Random rotation
        var randomRotation = Math.floor(Math.random() * 360);
          // Random Scale
        var randomScale = Math.random() * 1;
        // Random width & height between 0 and viewport
        var randomWidth = Math.floor(Math.random() * Math.max(document.documentElement.clientWidth, window.innerWidth || 0));
        var randomHeight =  Math.floor(Math.random() * Math.max(document.documentElement.clientHeight, window.innerHeight || 500));

        // Random animation-delay
        var randomAnimationDelay = Math.floor(Math.random() * 15);

        // Random colors
        var colors = ['#f49918', '#a1a9da', '#1edd87'];
        var randomColor = colors[Math.floor(Math.random() * colors.length)];

        // Create confetti piece
        var confetti = document.createElement('div');
        confetti.className = 'confetti';
        confetti.style.top=randomHeight + 'px';
        confetti.style.right=randomWidth + 'px';
        confetti.style.backgroundColor=randomColor;
        confetti.style.obacity=randomScale;
        confetti.style.transform='skew(15deg) rotate(' + randomRotation + 'deg)';
        confetti.style.animationDelay=randomAnimationDelay + 's';
        document.getElementById("confetti-wrapper").appendChild(confetti);
      }

      setTimeout(() => {
        let confettiWrapper = document.getElementById("confetti-wrapper");
        confettiWrapper.remove();
      }, "1000")

    })
  }
}
