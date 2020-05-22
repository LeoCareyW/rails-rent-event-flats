import Typed from 'typed.js';

const initTyped = () => {
  const element = document.getElementById('js-typed-text')
  console.log(element)
  if (element) {
    new Typed('#js-typed-text', {
      strings: ["Flat", "House", "Party House..."],
      typeSpeed: 100,
      loop: true
    });
   }
  }

export { initTyped };
