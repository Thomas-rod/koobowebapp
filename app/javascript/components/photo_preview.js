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
  }
  if (input.files && input.files[1]) {
    const reader2 = new FileReader();
    reader2.onload = (event) => {
      document.getElementById('photo-preview2').src = event.currentTarget.result;
    }
    reader2.readAsDataURL(input.files[1])
    document.getElementById('photo-preview2').classList.remove('hidden');
  }
}

export { previewImageOnFileSelect };
