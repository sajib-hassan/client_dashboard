Dropzone.autoDiscover = false
$(document).on 'turbolinks:load', ->
  if $('#employees-dropzone').length == 0
    return
  Dropzone.options.employeesDropzone =
    maxFiles: 1
    autoProcessQueue: false
    dictDefaultMessage: 'Drop your Excel file here'
    init: ->
      @on 'error', (file, error) ->
        $('#detailed-error').text 'An error occurred during the upload. ' + error.detail + '. Please fix the problem and try again.'
        $('#detailed-error').show()
        $('#modal-footer-idle').show()
        $('#modal-footer-uploading').hide()
        return
      @on 'success', (file) ->
        $('#import-modal-successful-body').show()
        $('#import-modal-uploading-body').hide()
        $('#modal-footer-idle').show()
        $('#modal-footer-uploading').hide()
        $('#import-modal-footer').hide()
        return
      @on 'addedfile', ->
        $('#detailed-error').text ''
        $('#detailed-error').hide()
        return
      return
    maxfilesexceeded: (file) ->
      @removeAllFiles()
      @addFile file
      return

  new Dropzone('#employees-dropzone')
  return


$(document).on 'turbolinks:load', ->

  $('#import-modal').on 'hidden.bs.modal', ->
    Dropzone.forElement('#employees-dropzone').removeAllFiles()
    $('#detailed-error').hide()
    $('#import-modal-successful-body').hide()
    $('#import-modal-uploading-body').show()
    $('#modal-footer-idle').show()
    $('#modal-footer-uploading').hide()
    $('#import-modal-footer').show()
    return

  $('#import-modal-upload-btn').click ->
    Dropzone.forElement('#employees-dropzone').processQueue()
    $('#modal-footer-idle').hide()
    $('#modal-footer-uploading').show()
    return

  $('#import-modal-finish-button').click (event) ->
    event.preventDefault()
    location.href = '/employees'
    return
  return
