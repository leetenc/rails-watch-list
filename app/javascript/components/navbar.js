const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const banner = document.querySelector('.home-banner')
  if (navbar) {
    if (banner) {
      window.addEventListener('scroll', () => {
        if (window.scrollY >= banner.clientHeight) {
          navbar.classList.add('navbar-lewagon-white');
        } else {
          navbar.classList.remove('navbar-lewagon-white');
        }
      });
    } else {
      navbar.classList.add('navbar-lewagon-white');
    }
  }
}

export { initUpdateNavbarOnScroll };
