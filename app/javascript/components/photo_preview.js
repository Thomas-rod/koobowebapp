const previewImageOnFileSelect = () => {
  const input = document.getElementById('photo-input');
  if (input) {
    input.addEventListener('change', () => {
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('hidden');
    document.querySelector(".hide-carousel").classList.remove('hide-carousel')
  }
  if (input.files && input.files[1]) {
    const reader2 = new FileReader();
    reader2.onload = (event) => {
      document.getElementById('photo-preview2').src = event.currentTarget.result;
    }
    reader2.readAsDataURL(input.files[1])
    document.getElementById('photo-preview2').classList.remove('hidden');
    document.querySelector(".hide-carousel").classList.remove('hide-carousel')
  }
  if (input.files && input.files[2]) {
    const reader3 = new FileReader();
    reader2.onload = (event) => {
      document.getElementById('photo-preview3').src = event.currentTarget.result;
    }
    reader3.readAsDataURL(input.files[2])
    document.getElementById('photo-preview3').classList.remove('hidden');
    document.querySelector(".hide-carousel").classList.remove('hide-carousel')
  }
}

export { previewImageOnFileSelect };


