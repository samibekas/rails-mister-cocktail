import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('sweet-alert-demo');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Well done! 🚀",
        text: "Cocktail was created",
        icon: "success",
        buttons: false,
        timer: 10000,
      });
    });
  }
}

export { bindSweetAlertButtonDemo };
