const makeButtonLoaderAppearTenant = () => {

  const form_identity_card = document.getElementById("js-identity_card")
  const form_payslips = document.getElementById("js-payslips")
  const form_proof_residence = document.getElementById("js-proof_residence")
  const form_notice_assessment = document.getElementById("js-notice_assessment")
  const form_rent_receipts = document.getElementById("js-rent_receipts")
  const form_student_card = document.getElementById("js-student_card")
  const form_bank_identity = document.getElementById("js-bank_identity")


  const button_loader_identity = document.getElementById("submit-file-upload-identity_card")
  const button_loader_payslips = document.getElementById("submit-file-upload-payslips")
  const button_loader_residence = document.getElementById("submit-file-upload-proof_residence")
  const button_loader_assessment = document.getElementById("submit-file-upload-notice_assessment")
  const button_loader_receipts = document.getElementById("submit-file-upload-rent_receipts")
  const button_loader_student = document.getElementById("submit-file-upload-student_card")
  const button_loader_bank = document.getElementById("submit-file-upload-bank_identity")

  if (form_identity_card || form_payslips || form_proof_residence || form_notice_assessment || form_rent_receipts || form_student_card || form_bank_identity) {
    if (form_identity_card) {
      form_identity_card.addEventListener('click', () => {
        document.getElementById("submit-file-upload-identity_card").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-identity_card").classList.toggle('hide-file')
      })
    }
    if (form_payslips) {
      form_payslips.addEventListener('click', () => {
        document.getElementById("submit-file-upload-payslips").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-payslips").classList.toggle('hide-file')
      })
    }
    if (form_proof_residence) {
      form_proof_residence.addEventListener('click', () => {
        document.getElementById("submit-file-upload-proof_residence").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-proof_residence").classList.toggle('hide-file')
      })
    }
    if (form_notice_assessment) {
      form_notice_assessment.addEventListener('click', () => {
        document.getElementById("submit-file-upload-notice_assessment").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-notice_assessment").classList.toggle('hide-file')
      })
    }
    if (form_rent_receipts) {
      form_rent_receipts.addEventListener('click', () => {
        document.getElementById("submit-file-upload-rent_receipts").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-rent_receipts").classList.toggle('hide-file')
      })
    }
    if (form_student_card) {
      form_student_card.addEventListener('click', () => {
        document.getElementById("submit-file-upload-student_card").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-student_card").classList.toggle('hide-file')
      })
    }
    if (form_bank_identity) {
      form_bank_identity.addEventListener('click', () => {
        document.getElementById("submit-file-upload-bank_identity").classList.toggle('hide-file')
      })
      button_loader_technical.addEventListener('click', () => {
        document.getElementById("submit-file-upload-bank_identity").classList.toggle('hide-file')
      })
    }
  }
}



export { makeButtonLoaderAppearTenant };
