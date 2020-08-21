window.addEventListener("trix-file-accept", function(event) {
  const acceptedTypes = ['image/jpeg', 'image/png']
  const maxFileSize = 1024 * 1024
  if (!acceptedTypes.includes(event.file.type)) {
    event.preventDefault()
    alert("JPEG or PNG files only.")
  }
  else if (event.file.size > maxFileSize) {
    event.preventDefault()
    alert("File must be less than 1MB.")
  }
})
