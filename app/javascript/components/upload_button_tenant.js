const makeButtonLoaderAppearTenant = () => {
  const formsUpload = document.querySelectorAll(".add-file-clickable")
  if (formsUpload) {
    formsUpload.forEach((form) => {
      form.addEventListener('click', (event) => {
        const buttonUpload = event.path[3][3]
        buttonUpload.classList.remove('hide-file');
        buttonUpload.addEventListener('click', () => {
          buttonUpload.classList.add('hide-file');
        })
      })
    });
  };
}



export { makeButtonLoaderAppearTenant };
