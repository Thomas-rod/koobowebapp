const makeButtonLoaderAppearRenter = () => {

  const form_technical_diagnostic = document.getElementById("js-technical_diagnostic")
  const form_information_leaflet = document.getElementById("js-information_leaflet")
  const form_co_owner_document = document.getElementById("js-co_owner_document")

  const button_loader_technical = document.getElementById("submit-file-upload-technical_diagnostic")
  const button_loader_leaflet = document.getElementById("submit-file-upload-information_leaflet")
  const button_loader_owner = document.getElementById("submit-file-upload-co_owner_document")

  if (form_technical_diagnostic || form_information_leaflet || form_co_owner_document) {
    if (form_technical_diagnostic) {
      form_technical_diagnostic.addEventListener('click', () => {
        document.getElementById("submit-file-upload-technical_diagnostic").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-technical_diagnostic").classList.toggle('hide-file')
      })
    }

    if (form_information_leaflet) {
      form_information_leaflet.addEventListener('click', () => {
        document.getElementById("submit-file-upload-information_leaflet").classList.toggle('hide-file')
      })
      button_loader_leaflet.addEventListener('click', () => {
        document.getElementById("submit-file-upload-information_leaflet").classList.toggle('hide-file')
      })
    }

    if (form_co_owner_document) {
      form_co_owner_document.addEventListener('click', () => {
        document.getElementById("submit-file-upload-co_owner_document").classList.toggle('hide-file')
      })
      button_loader_owner.addEventListener('click', () => {
        document.getElementById("submit-file-upload-co_owner_document").classList.toggle('hide-file')
      })
    }
  }
}



export { makeButtonLoaderAppearRenter };
