$(document).ready(() => {
  $('.all-answers').on('submit', '.best-answer-selector', (e) => {
    e.preventDefault();
    const url_id = $(e.target).attr('action');
  $.ajax({
    method: 'post',
    url: url_id
  }).done( (response) => {
      console.log(response.includes('answers-show'));
      if (response.includes('answers-show')) {
        // deselecting
        $('.best-answer').hide();
        $('.select').show();
      } else {
        // selecting
        $('.best-answer').show();
        $('.best-answer').html(response);
        $('.deselect').show();
        $('.select').hide();

      };
    });
  });

  $('#answer-form').submit((e) => {
    e.preventDefault();
    const url = $(e.target).attr('action')
    const data = $(e.target).find('textarea').serialize();

    request = $.ajax({
      method: "POST",
      url,
      data
    });

    request.done((response) => {
      $('#all-answers').append(response);
      $('#all-answers').append('<h3>You have already answered this question.</h3>');
      $(e.target).remove();
    });

    request.fail((obj, status, error) => {
      $('#all-answers').append('<p style="color:red;font-size:10pt">Can not answer own question</p>');
      $(e.target).find('textarea').val("");
    });
  });
});

  $(document).on('submit', '.comment-form', (e) => {
  e.preventDefault();
  debugger
})
